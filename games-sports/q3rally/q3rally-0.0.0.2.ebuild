# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="An ioq3 based Racing Game."
HOMEPAGE="http://www.q3rally.com"
SRC_URI="http://www.q3rally.com/wp-content/plugins/download-monitor/download.php?id=20"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack(){
	elog ${A}
	mv /usr/portage/distfiles/${A} /usr/portage/distfiles/q3rally_v0002.zip
	unpack q3rally_v0002.zip
}

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
