# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic games

DESCRIPTION="Massively multiplayer pong game"
HOMEPAGE="http://www.mmpong.net/trac"
SRC_URI="http://www.mmpong.net/trac/downloads/mmpong-0.9.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="
"

DIR=${WORKDIR}/${P}

src_conf(){
	cd ${DIR}
	 mkdir cmake_build
	 cd cmake_build   
	 cmake .. 	
	}

src_compile() {
        cd ${DIR}
	emake
}

src_install () {
	cd ${DIR}
        dogamesbin mmpong
        dogamesbin mmpong-gl
        dogamesbin mmpongd


        einfo "copying gamedata-files ..."
        libinto "/usr/lib"
        dolib libmmpong.so || die "failed while copying gamedata"

#        emake DESTDIR="${D}" install || die "install failed"
	prepgamesdirs
}



