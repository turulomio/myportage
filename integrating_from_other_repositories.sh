#!/bin/bash
# Script para integrar y sincronizar ebuilds desde repositorios externos de GitHub.

# Asegurarnos de que estamos en la raíz del repositorio de Gentoo (overlay)
if [ ! -d "profiles" ]; then
    echo "Error: No estás en la raíz de un repositorio de Gentoo (falta el directorio profiles)."
    exit 1
fi

integrate_from_github() {
    local url="$1"
    
    # Extraer owner, repo, branch y ruta relativa desde la URL de GitHub
    # Ejemplo: https://github.com/jrubioh1/j-overlay/tree/main/app-crypt/autofirma-dnie
    if [[ "$url" =~ ^https://github\.com/([^/]+)/([^/]+)/tree/([^/]+)/(.*)$ ]]; then
        local owner="${BASH_REMATCH[1]}"
        local repo="${BASH_REMATCH[2]}"
        local branch="${BASH_REMATCH[3]}"
        local rel_path="${BASH_REMATCH[4]}"
    else
        echo "Error: La URL '$url' no tiene un formato válido de GitHub tree (ej: https://github.com/user/repo/tree/branch/cat/pkg)."
        return 1
    fi

    local repo_url="https://github.com/${owner}/${repo}.git"
    local tmp_dir
    tmp_dir=$(mktemp -d)

    echo "=================================================="
    echo "Sincronizando: ${rel_path} desde ${owner}/${repo} (${branch})"
    echo "=================================================="

    # Clonar solo la rama indicada (superficialmente)
    git clone --depth 1 --branch "$branch" --single-branch "$repo_url" "$tmp_dir" &>/dev/null
    if [ $? -ne 0 ]; then
        echo "Error al clonar el repositorio $repo_url"
        rm -rf "$tmp_dir"
        return 1
    fi

    local src_dir="${tmp_dir}/${rel_path}"
    if [ ! -d "$src_dir" ]; then
        echo "Error: La ruta '${rel_path}' no existe dentro del repositorio."
        rm -rf "$tmp_dir"
        return 1
    fi

    # Crear el directorio de destino
    mkdir -p "$rel_path"

    # Copiar/sincronizar todos los archivos
    if command -v rsync &>/dev/null; then
        rsync -av --delete --exclude='.git*' "${src_dir}/" "${rel_path}/"
    else
        rm -rf "${rel_path:?}"/*
        cp -r "${src_dir}/"* "${rel_path}/"
    fi

    rm -rf "$tmp_dir"

    echo "Sincronización de '${rel_path}' completada."

    # Regenerar Manifest si existen ebuilds
    if ls "${rel_path}"/*.ebuild &>/dev/null; then
        echo "Actualizando Manifest en ${rel_path}..."
        (cd "${rel_path}" && ebuild "$(ls *.ebuild | head -n 1)" digest &>/dev/null) || {
            local repo_name
            repo_name=$(grep "repo-name" metadata/layout.conf 2>/dev/null | awk '{print $3}')
            repo_name="${repo_name:-$(basename "$PWD")}"
            egencache --repo="$repo_name" --update-manifests &>/dev/null
        }
    fi
}

# Integraciones configuradas
integrate_from_github "https://github.com/jrubioh1/j-overlay/tree/main/app-crypt/autofirma-dnie"
