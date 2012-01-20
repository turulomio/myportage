# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games

DESCRIPTION="This is a project to create artificial intelligence opponent(s) for the card game Race for the Galaxy"
HOMEPAGE="http://keldon.net/rftg/"
SRC_URI="http://warpcore.org/rftg/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="
"
RDEPEND=${DEPEND}

src_install(){
        emake DESTDIR="${D}" install || die "install failed"
	doicon ${FILESDIR}/rftg.jpg
	make_desktop_entry rftg "Race for the galaxy" /usr/share/pixmaps/rftg.jpg

}
