# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MYPV=${PV//./} 
DESCRIPTION="An ioq3 based Racing Game."
HOMEPAGE="http://www.q3rally.com"
SRC_URI="http://www.q3rally.com/wp-content/uploads/downloads/2011/08/q3rally_v${MYPV}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"


src_compile(){
	emake| die
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
