#!/bin/bash
# Script para regenerar los archivos Manifest (ebuild digest) en todo el overlay.

# Asegurarnos de que estamos en la raíz del repositorio de Gentoo (overlay)
if [ ! -d "profiles" ]; then
    echo "Error: No estás en la raíz de un repositorio de Gentoo (falta el directorio profiles)."
    exit 1
fi

echo "Iniciando regeneración de Manifests en todo el repositorio..."

find . -mindepth 3 -maxdepth 3 -name "*.ebuild" | while read -r ebuild_path; do
    dir=$(dirname "$ebuild_path")
    ebuild_file=$(basename "$ebuild_path")
    echo "Procesando digest: ${ebuild_path}"
    (cd "$dir" && ebuild "$ebuild_file" digest &>/dev/null)
done

echo "--------------------------------------------------"
echo "¡Proceso de regeneración de Manifests completado con éxito!"
