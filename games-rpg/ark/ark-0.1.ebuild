# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games
EAPI=2



DESCRIPTION="The Ark is an open source, single player 3D RPG, based on a fantasy world"
HOMEPAGE="http://ark-rpg.sourceforge.net"
SRC_URI="mirror://sourceforge/project/ark-rpg/Ark%20tech%20preview/ark-${PV}.tar.bz"
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
