# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games cmake-utils

DESCRIPTION="Ollie the Oligocheata is a worm on a mission"
HOMEPAGE="http://www.tweeler.com/index.php?PAGE=goollie_linux"
SRC_URI="http://www.tweeler.com/GoOllie_${PV}_src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND=${DEPEND}
S=${WORKDIR}/GoOllie_1.3_src

src_configure() {
	cd ${S}
	mkdir build
	cd build
        cmake ..
}

src_compile() {
	cd ${S}/build
	make
}

#src_install() {
#	dogamesbin src/enelin7
#        einfo "copying gamedata-files ..."
#        insinto "${GAMES_DATADIR}"/${PN}/
#        doins -r data/* || die "failed while copying gamedata"
#	prepgamesdirs
#}

