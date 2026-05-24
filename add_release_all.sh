#!/bin/bash
# Ejecutar este script desde la raíz de tu overlay

# Asegurarnos de que estamos en un directorio válido de Gentoo
if [ ! -d "profiles" ]; then
    echo "Error: No estás en la raíz de un repositorio de Gentoo (falta el directorio profiles)."
    exit 1
fi

echo "Iniciando incremento de revisión en todo el repositorio..."

# Buscar todos los ebuilds de manera recursiva
find . -mindepth 3 -maxdepth 3 -name "*.ebuild" | while read -r ebuild_path; do
    dir=$(dirname "$ebuild_path")
    filename=$(basename "$ebuild_path" .ebuild)
    
    # Comprobar si el ebuild ya termina en una revisión (ej: -r2)
    if [[ "$filename" =~ -r([0-9]+)$ ]]; then
        # Extraer el número de revisión actual e incrementarlo
        rev="${BASH_REMATCH[1]}"
        nueva_rev=$((rev + 1))
        # Reemplazar la revisión vieja por la nueva en el nombre del archivo
        nuevo_filename="${filename%-r*}-r${nueva_rev}"
    else
        # Si no tiene revisión, la primera será -r1
        nuevo_filename="${filename}-r1"
    fi
    
    nuevo_ebuild_path="${dir}/${nuevo_filename}.ebuild"
    
    echo "Incrementando: $ebuild_path -> $nuevo_ebuild_path"
    
    # 1. Copiar el ebuild a la nueva revisión
    cp "$ebuild_path" "$nuevo_ebuild_path"
    
    # 2. Eliminar el ebuild anterior para que Portage fuerce la actualización
    rm "$ebuild_path"
done

echo "--------------------------------------------------"
echo "Ebuilds duplicados con nueva revisión con éxito."
echo "Regenerando archivos Manifest masivamente..."
echo "--------------------------------------------------"

# 3. Regenerar los Manifest de todo el repositorio en paralelo de forma masiva
# Extraemos el nombre del repositorio actual desde su configuración externa
REPO_NAME=$(build_name=$(grep "repo-name" metadata/layout.conf 2>/dev/null | awk '{print $3}'); echo "${build_name:-$(basename "$PWD")}")

egencache --repo="$REPO_NAME" --update-manifests --jobs=$(nproc)

echo "¡Proceso completado para todo el árbol del repositorio!"