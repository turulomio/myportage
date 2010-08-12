# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

MY=lentilwars_1_0_1
DESCRIPTION="The world is in dispute for there is permanent conflict among Lentilky (Smarties), M&M's and Reese's Pieces. "
HOMEPAGE="http://lwars.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${MY}_all.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/$MY
DEPEND="
"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "einstall failed"
}
