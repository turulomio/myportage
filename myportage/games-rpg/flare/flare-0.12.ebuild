# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games
EAPI=2

MY_PV=`echo ${PV}|sed 's/\.//g'`


DESCRIPTION="Free action roleplaying game"
HOMEPAGE="http://clintbellanger.net/rpg/"
SRC_URI="http://flare-engine.googlecode.com/files/flare_src_v${MY_PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND="
media-libs/libsdl
media-libs/sdl-image
media-libs/sdl-mixer[vorbis]
"

RDEPEND="${DEPEND}"

S=${WORKDIR}/flare_v${MY_PV}

src_compile(){
   cd build
   cmake .
   emake || die
}

src_install(){
   newgamesbin  ${FILESDIR}/flare.sh flare.sh
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   doexe flare

   insinto ${GAMES_DATADIR}/${PN}
   doins -r  enemies   fonts  images  items  maps  music  npcs  powers  soundfx  tilesetdefs || die "doins failed"
   dogamesdoc credits.html README.txt

   make_desktop_entry flare.sh Flare ${FILESDIR}/flare.png

   dodir /var/lib/flare/saves
   dosym /var/lib/flare/saves ${GAMES_DATADIR}/${PN}/saves
   fperms 770 /var/lib/flare/saves
   fowners games:games /var/lib/flare/saves

   prepgamesdirs
}
