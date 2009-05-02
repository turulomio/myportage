# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

inherit games autotools eutils

DESCRIPTION="Pong² is an up till now two player (networked) game inspired by the classical Pong"
HOMEPAGE="http://pong2.berlios.de/"
SRC_URI="http://download.berlios.de/pong2/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#DEPEND="dev-perl/sdl-perl"

#src_configure() {
#	econf --prefix=/usr/games || die "Fallo el econf"
#}

#src_install() {
#	emake DESTDIR="${D}" install || die "emake install failed"
#	prepgamesdirs
#}

