# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games

MYPV=`echo ${PV}| cut  -b  3-`

DESCRIPTION="Somyeol2D is a casual game. Somyeols are an almost extinct alien species. In Somyeol2D you have to rescue them"
HOMEPAGE="http://www.somyeol.com"
SRC_URI="http://www.somyeol.com/downloads/Somyeol2d_${MYPV}_source.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-lang/python
dev-lang/tk
games-util/jngl
"
RDEPEND="${DEPEND}"

src_configure(){
#   touch data/maps/Original/highscore.hsc
  elog "Nothing to configure"

}

src_compile(){
	elog "Nothing to compile"
}


src_install(){
   newgamesbin  ${FILESDIR}/somyeol.sh somyeol.sh
#   exeopts -m0750
#   exeinto ${GAMES_DATADIR}/${PN}
#   doexe flare

   insinto ${GAMES_DATADIR}/${PN}
   doins *.py *.pyx || die "doins failed"
   doins -r  data img sound || die "doins failed"
   dodoc *.txt *.rtf

#   dodir /var/lib/somyeol/data/maps/Original/
#   dosym data/maps/Original/highscore.hsc /var/lib/somyeol/data/maps/Original/highscore.hsc 
#   fperms 770 /var/lib/somyeol/data/maps/Original/highscore.hsc 
#   fowners games:games /var/lib/somyeol/data/maps/Original/highscore.hsc 



   make_desktop_entry somyeol.sh Somyeol ${FILESDIR}/somyeol.png

   prepgamesdirs
}
