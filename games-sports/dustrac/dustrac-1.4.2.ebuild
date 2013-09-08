# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=5

inherit eutils

DESCRIPTION="Dust Racing (Dustrac) is a tile-based, cross-platform 2D racing game written in Qt (C++) and OpenGL."
HOMEPAGE="http://dustrac.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/src/${P}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
"
RDEPEND="${DEPEND}"


src_configure(){
./configure   -DCMAKE_INSTALL_PREFIX=${D}/usr/games/dustrac
#sed -i 's:BIN_PATH .:BIN_PATH ./bin:' CMakeLists.txt
#sed -i 's:DATA_PATH ./data:DATA_PATH ./share/dustrac/data/:' CMakeLists.txt
#sed -i 's:DOC_PATH .:DOC_PATH ./share/dustrac/:' CMakeLists.txt
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
