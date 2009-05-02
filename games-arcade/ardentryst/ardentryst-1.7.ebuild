# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="Ardentryst is an action/RPG sidescoller, focused not just on fighting, but on story, and character development."
HOMEPAGE="http://jordan.trudgett.com/"
SRC_URI="mirror://sourceforge/ardentryst/Ardentryst17Source.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/Ardentryst17/"

src_install() {
        cp ${FILESDIR}/ardentryst.sh ${S}

	cd ${S}

	mkdir -p  "${D}/${GAMES_DATADIR}/${PN}/"
	cp -r * "${D}/${GAMES_DATADIR}/${PN}/"

	dogamesbin ardentryst.sh

#	insinto "${GAMES_DATADIR}/${PN}"
#	doins *

#        insinto "${GAMES_DATADIR}/${PN}/Base"
#	doins Base/*

#        insinto "${GAMES_DATADIR}/${PN}/Data"
#        doins Data/*

	prepgamesdirs
}

