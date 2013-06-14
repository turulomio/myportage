# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

DESCRIPTION="Core data for vcmi"
HOMEPAGE="http://forum.vcmi.eu/index.php"
MY_P="core"
SRC_URI="http://download.vcmi.eu/${MY_P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"

src_install() {
insinto "${GAMES_DATADIR}/${PN%-data}"
doins -r *
}


