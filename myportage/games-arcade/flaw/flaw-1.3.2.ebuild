# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games


DESCRIPTION="F.L.A.W. is a free top-down wizard battle game that can be played by up to 5 players. The goal of the game is to survive as long as possible while more and more fireballs appear in the arena."
HOMEPAGE="http://flaw.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/flaw/flaw/${PV}/flaw-${PV}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
"
RDEPEND="${DEPEND}"


src_install(){
   newgamesbin  ${FILESDIR}/zod.sh zod.sh
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   doexe zod_src/zod 
   doexe zod_launcher_src/zod_launcher


   insinto ${GAMES_DATADIR}/${PN}
   doins *.map *.txt
   doins -r  assets blank_maps || die "doins failed"

   newicon assets/icon.png zod.png
   make_desktop_entry zod.sh Zod /usr/share/pixmaps/zod.png

   prepgamesdirs
}
