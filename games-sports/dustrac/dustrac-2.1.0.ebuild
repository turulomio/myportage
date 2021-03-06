# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit cmake-utils

DESCRIPTION="Dust Racing (Dustrac) is a tile-based, cross-platform 2D racing game written in Qt (C++) and OpenGL."
HOMEPAGE="https://github.com/juzzlin/DustRacing2D"
SRC_URI="https://github.com/juzzlin/DustRacing2D/archive/${PV}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="amd64 x86"
IUSE=""
SLOT=0

DEPEND="
dev-qt/qtopengl
media-libs/openal
media-libs/libvorbis
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/DustRacing2D-2.0.1/

src_configure(){
    ./configure    -DCMAKE_INSTALL_PREFIX=${D}/usr/games/dustrac

}

src_compile(){
    emake 
}
src_install(){
	emake install 
	dobin ${FILESDIR}/dustrac*
	insinto /usr/share/pixmaps 
	doins data/icons/dustrac-*
        make_desktop_entry dustrac-game "Dusting Race Game" /usr/share/pixmaps/dustrac-game
        make_desktop_entry dustrac-editor "Dusting Race Editor" /usr/share/pixmaps/dustrac-editor
}
