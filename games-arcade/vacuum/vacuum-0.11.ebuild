# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="."
HOMEPAGE="http://apocalypse.rulez.org/vacuum/"
SRC_URI="http://213.203.218.125/v/va/vacuum/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"


#S="${WORKDIR}/${P}"
dir=${GAMES_DATADIR}/${P}

src_configure() {
	econf --prefix=/usr/games || die "Fallo el econf"
}

#src_compile() {
#        cd ${S}
#	emake  || die "emake failed"
#}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdir
}

