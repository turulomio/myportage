# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit cmake-utils games

DESCRIPTION="Cuba Letra is a new type of word game with a fun and funky Latin American theme! "
HOMEPAGE="http://tweeler.com/index.php?PAGE=cubaletra_linux"
SRC_URI="http://www.tweeler.com/CubaLetra_${PV}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="
games-util/libtuxcap"
RDEPEND=${DEPEND}

S=${WORKDIR}/CubaLetra_${PV}_src/

src_configure(){
	cmake .
}
