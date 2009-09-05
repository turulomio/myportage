# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Mariano Muñoz $

inherit games 
EAPI=2

DESCRIPTION="Connectagram is a word unscrambling game."
HOMEPAGE="http://gottcode.org/connectagram/"
SRC_URI="http://gottcode.org/connectagram/${P}-src.tar.bz2"
KEYWORDS="~amd64 ~x86"
SLOT=0
RDEPEND="
"
DEPEND="${RDEPEND}"


src_compile(){
	qmake ${PN}.pro
	emake
}

src_install(){
        dogamesbin bin/connectagram
        insinto /usr/games/share/${PN}
        doins  share/${PN}/words


        doicon icons/${PN}.ico
        make_desktop_entry ${PN} "Connectagram" /usr/share/pixmaps/${PN}.ico

        prepgamesdirs
}
