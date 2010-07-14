# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games

DESCRIPTION="An old-school 2d platformer game, starring a certain quixotic frog"
HOMEPAGE="http://www.frogatto.com"
SRC_URI="http://www.frogatto.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure(){
        sed -i -e 's:ccache::' Makefile
        echo "#!/bin/bash" >> frogatto
        echo "mypwd=\`pwd\`" >> frogatto
        echo "cd /usr/share/games/frogatto" >> frogatto
        echo "./game" >> frogatto
        echo "cd $mypwd" >> frogatto
        chown root:games frogatto
        chmod 755 frogatto
}

src_install(){
        mkdir -p ${D}/usr/games/bin/
        cp -R frogatto ${D}//usr/games/bin/

        mkdir -p ${D}/${GAMES_DATADIR}/frogatto/data
        cp -R data/* ${D}/${GAMES_DATADIR}/frogatto/data

        mkdir -p ${D}/${GAMES_DATADIR}/frogatto/images    
        cp -R images/* ${D}/${GAMES_DATADIR}/frogatto/images

        cp game ${D}/${GAMES_DATADIR}/frogatto/

}
