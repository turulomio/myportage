# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MYV=`echo ${PV}| cut -c -4`-`echo ${PV}| cut -c 5-6`-`echo ${PV}| cut -c 7-8`


DESCRIPTION="The Zod Engine is an open source remake of the 1996 game Z by the Bitmap Brothers"
HOMEPAGE="http://zod.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/zod/linux_releases/zod_linux-${MYV}.tar.gz"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/zod_engine/

src_compile(){
   elog "Compiling zod_src"
   cd zod_src
   emake || die "emake failed"
   elog "Compiling zod_launcher_src"
   cd ../zod_launcher_src
   emake || die "emake failed"
}

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
