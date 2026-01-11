# Copyright 2025 Your Name
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Usamos la eclass binary para manejar paquetes precompilados
#inherit binary

DESCRIPTION="A CLI tool to record awesome terminal GIFs."
HOMEPAGE="https://github.com/charmbracelet/vhs"
SLOT="0"

# La URL debe apuntar al archivo que contiene la estructura que mostraste
# Asumo que el nombre original del archivo descargable era vhs_0.10.0_Linux_x86_64.tar.gz
SRC_URI="https://github.com/charmbracelet/vhs/releases/download/v${PV}/vhs_${PV}_Linux_x86_64.tar.gz"
# Se usa ~amd64 porque es un binario para esta arquitectura
KEYWORDS="~amd64"

# Dependencias de tiempo de ejecución (ninguna específica requerida para este binario)
RDEPEND="
    www-apps/ttyd
"
S="${WORKDIR}/vhs_0.10.0_Linux_x86_64"
# -----------------------------------------------------------------
# Fase de Instalación (src_install)
# -----------------------------------------------------------------
src_install() {
    # El directorio de trabajo es vhs_0.10.0_Linux_x86_64 (asumiendo que el tarball lo desempaqueta así)
    # Definimos la ruta base para mayor claridad:
    # 1. Instalar el binario principal (vhs)
    # El archivo binario vhs debe tener permisos de ejecución
    dobin "${S}"/vhs

    # 2. Instalar el archivo de Licencia (opcional, pero buena práctica)
    #doins "${S}"/LICENSE

    # 3. Instalar las páginas man (.1.gz)
    #doman "${S}"/manpages/vhs.1.gz

    # 4. Instalar las compleciones de shell (bash, zsh, fish)
    # Usamos doinst para que se instalen en /usr/share/bash-completion/completions/
    # o /usr/share/zsh/site-functions/
    # La eclass binary no tiene helper para esto, usamos doinst y la eclass shell-completion si quieres hacerlo bien.
    
    # Para simplicidad y siguiendo el patrón Gentoo:
    
    # Comandos bash (Gentoo usa /etc/bash/bashrc o profiles/etc/bash/bashrc)
    # Opcionalmente, se podrían instalar en /usr/share/bash-completion/completions/
    #doins -r "${S}"/completions
}