# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit flag-o-matic games

DESCRIPTION="Arkanoid/Breakout clone with pretty graphics."
HOMEPAGE="https://sourceforge.net/projects/sdl-ball"
SRC_URI="http://213.203.218.125/v/va/vacuum/vacuum-0.10.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"


S=${WORKDIR}/vacuum-0.10
dir=${GAMES_DATADIR}/${PN}

src_configure() {
        mkdir ${S}
        cd ${S}         
	econf || die "Fallo el econf"

}

src_compile() {
        cd ${S}
	emake  || die "emake failed"
}

src_install() {
        cd ${S}
	emake install| die "emake install failed"
}

