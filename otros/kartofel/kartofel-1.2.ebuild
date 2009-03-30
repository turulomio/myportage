# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils games cmake-utils

DESCRIPTION="Kartofel is a game of skill and logic. The objective is to connect the numbered dots in order, without crossing over yourself. "
HOMEPAGE="http://kartofel.jfedor.org/"
SRC_URI="http://kartofel.jfedor.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

dir=${GAMES_DATADIR}/${PN}

src_compile() {
	emake || die "emake failed"
}

src_install() {
        dogamesbin kartofel || die "dogamesbin failed"

        insinto "${dir}"
        doins -r fonts/*.ttf || die "doins failed"

	make_desktop_entry ${PN} Kartofel


	prepgamesdirs
}
