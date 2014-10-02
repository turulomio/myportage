# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit base games

DESCRIPTION="cue sports simulator, aimed for physical accuracy and simplicity"
HOMEPAGE="http://www.nongnu.org/billiards/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/lua"
RDEPEND="${DEPEND}
	dev-games/techne"

DOCS=( AUTHORS ChangeLog NEWS README )

src_configure() {
	egamesconf techne="${GAMES_BINDIR}"/techne
}

src_install() {
	base_src_install
	prepgamesdirs
}

