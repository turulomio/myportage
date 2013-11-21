# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

inherit games autotools eutils

DESCRIPTION="Xdriller is a portable Puzzle/Arcade video game. Xdriller is based on the gameplay of the Mr. Driller series, where you have to drill through Tetris-like screens of blocks and collect power-ups while avoiding being squashed by falling blocks"
HOMEPAGE="http://xdriller.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
dev-games/ogre
dev-games/ois
"
RDEPEND="${DEPEND}"
src_configure() {
	sed -i -e 's:INSTALL_PREFIX=/usr:INSTALL_PREFIX=${DESTDIR}/usr:' Makefile

}

#src_install() {
#	emake DESTDIR="${D}" install || die "emake install failed"
#	prepgamesdirs
#}

