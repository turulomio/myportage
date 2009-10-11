# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games eutils

DESCRIPTION=""
HOMEPAGE="http://www.izedesign.it/cararena/index_eng.html"
SRC_URI="http://www.izedesign.it/cararena/cararena_linux.rar"

LICENSE="Creative commons"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"


src_compile(){
	cd ${S}
	cd ../ImageLib/src
	emake
	cd ../../BlockOut
        sed -i -e "s:/users/pons/test/opengl/SDL:/usr:" Makefile
        sed -i -e "s:../ImageLib:../ImageLib/src:" Makefile
	emake
}

src_install() {
	cd ${S}
        cp ${FILESDIR}/blockout.sh blockout.sh
        cp ${FILESDIR}/blockout.jpg blockout.jpg
        dogamesbin blockout.sh
        exeinto /usr/share/games/blockout/; doexe blockout
        insinto /usr/share/games/blockout/images; doins images/*; doins blockout.jpg
        insinto /usr/share/games/blockout/sounds; doins sounds/*
        make_desktop_entry blockout.sh "Blockout" /usr/share/games/blockout/images/blockout.jpg

}
