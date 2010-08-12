# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY=lentilwars_1_1_0
DESCRIPTION="The world is in dispute for there is permanent conflict among Lentilky (Smarties), M&M's and Reese's Pieces. "
HOMEPAGE="http://lwars.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${MY}_all.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/$MY
DEPEND="
"
RDEPEND="${DEPEND}"

src_configure(){
        echo "#!/bin/bash" >> lwars
        echo "mypwd=\`pwd\`" >> lwars
        echo "cd /usr/games/share/lwars" >> lwars
        echo "./lentilwars" >> lwars
        echo "cd $mypwd" >> lwars
        chown root:games lwars
        chmod 755 lwars
}


src_install() {
	mkdir -p ${D}/usr/games/bin; cp lwars ${D}/usr/games/bin
        mkdir -p ${D}/usr/games/share/lwars/data; cp -R data/* ${D}/usr/games/share/lwars/data
        cp *.xml ${D}/usr/games/share/lwars
        cp lentilwars ${D}/usr/games/share/lwars
        mkdir -p ${D}/usr/games/share/lwars/intl; cp -R intl/* ${D}/usr/games/share/lwars/intl
        cp data/icon.xpm lentilwars.xpm
        doicon lentilwars.xpm
        make_desktop_entry lentilwars lentilwars /usr/share/pixmaps/lentilwars.xpm


        prepgamesdirs
}
