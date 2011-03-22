# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="MotoGT is 2D top-viewed game where you drive a MotoGP bike, and you want to win races"
HOMEPAGE="http://motogt.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/motogt/MotoGT-${PV}.zip"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
media-libs/libsfml
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/MotoGT

src_install(){
   newgamesbin  ${FILESDIR}/motogt.sh motogt.sh
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   newexe MotoGT.bin motogt 

   dodoc doc/* linux.txt

   insinto ${GAMES_DATADIR}/${PN}
   doins -r  data || die "doins failed"

   newicon data/tracks/00/minimap.png motogt.png
   make_desktop_entry motogt.sh MotoGT /usr/share/pixmaps/motogt.png

   prepgamesdirs
}
