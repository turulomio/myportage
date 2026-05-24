# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop

DESCRIPTION="Tile-based 2D racing game in Qt and OpenGL"
HOMEPAGE="https://github.com/juzzlin/DustRacing2D"
SRC_URI="https://github.com/juzzlin/DustRacing2D/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
S="${WORKDIR}/DustRacing2D-${PV}"
KEYWORDS="amd64 x86"

DEPEND="
	dev-qt/qtopengl:5
	media-libs/openal
	media-libs/libvorbis
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DReleaseBuild=ON
		-DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/share/pixmaps
	doins data/icons/dustrac-*
	make_desktop_entry dustrac-game "Dusting Race Game" /usr/share/pixmaps/dustrac-game
	make_desktop_entry dustrac-editor "Dusting Race Editor" /usr/share/pixmaps/dustrac-editor
}
