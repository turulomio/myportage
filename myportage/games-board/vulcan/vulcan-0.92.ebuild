# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Mariano Muñoz $

inherit games

DESCRIPTION="Vulcan lets you play against the computer a chess variant inspired by a certain well-known science fiction TV series"
HOMEPAGE="http://www.fzort.org/mpr/projects/vulcan/"
SRC_URI="http://www.fzort.org/mpr/projects/vulcan/vulcan-0.92.tar.gz"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


RDEPEND="
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${P}

src_install() 
{
	dogamesbin bin/${PN} || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r data/* || die "doins failed"
	cd "${S}"/po
	make DESTDIR="${D}" install || "make po install failed"
	cd "${S}"
	doicon data/xut-icon.png
	make_desktop_entry xut XUT
	dodoc COPYING
	prepgamesdirs
}

