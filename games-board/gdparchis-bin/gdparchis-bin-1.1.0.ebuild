# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop wrapper

DESCRIPTION="Godot parchis"
HOMEPAGE="https://github.com/turulomio/gdparchis/"
SRC_URI="
	https://github.com/turulomio/gdparchis/releases/download/${PV}/gdparchis-${PV}.x86_64 -> ${P}.x86_64
	https://github.com/turulomio/gdparchis/releases/download/${PV}/gdparchis-${PV}.pck -> ${P}.pck
"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Evita que Portage intente descomprimir binarios/pck como archivos comprimidos
src_unpack() {
	mkdir -p "${WORKDIR}" || die
	cp "${DISTDIR}/${P}.x86_64" "${WORKDIR}/${PN}.x86_64" || die
	cp "${DISTDIR}/${P}.pck" "${WORKDIR}/${PN}.pck" || die
}

src_install() {
	local dir="/opt/${PN}"

	# Instalar el binario ejecutable y el paquete de datos (.pck)
	exeinto "${dir}"
	newexe "${PN}.x86_64" "${PN}"

	insinto "${dir}"
	doins "${PN}.pck"

	# Crear el script lanzador en /usr/bin que pasa el .pck como parámetro
	make_wrapper "${PN}" "${EPREFIX}${dir}/${PN} --main-pack ${EPREFIX}${dir}/${PN}.pck"

	# Icono y lanzador de escritorio
	if [[ -f "${FILESDIR}/${PN}.png" ]]; then
		doicon "${FILESDIR}/${PN}.png"
	fi
	make_desktop_entry "${PN}" "gdParchis" "${PN}" "Game;BoardGame;"
}