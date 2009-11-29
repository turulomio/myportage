# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Mariano Muñoz $

inherit games 
EAPI=2

DESCRIPTION="Tanglet is a single player word finding game based on Boggle"
HOMEPAGE="http://gottcode.org/tanglet/"
SRC_URI="http://gottcode.org/tanglet/${P}-src.tar.bz2"
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
        dogamesbin tanglet
        insinto /usr/games/share/${PN}/icons
        doins  icons/*
        insinto /usr/games/share/${PN}/icons/tango
        doins  icons/tango/*
        insinto /usr/games/share/${PN}/data
        doins  data/*
        insinto /usr/games/share/${PN}/translations
        doins  translations/*

        doicon icons/${PN}.ico
        make_desktop_entry ${PN} "Tanglet" /usr/share/pixmaps/${PN}.ico

        prepgamesdirs
}
