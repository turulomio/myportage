# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="Shoot down enemy bombers threatening your city."
HOMEPAGE="http://proj.phk.at/el/7/"
SRC_URI="http://proj.phk.at/el/7/${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND=${DEPEND}

src_configure() {
        sed -i -e "s:/usr/local:/usr:" src/Makefile	
}

src_compile() {
	cd src
	emake  || die "Fallo el emake"
}

src_install() {
	dogamesbin src/enelin7

        einfo "copying gamedata-files ..."
        insinto "${GAMES_DATADIR}"/${PN}/
        doins -r data/* || die "failed while copying gamedata"

	prepgamesdirs
}

