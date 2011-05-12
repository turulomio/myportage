# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games
EAPI=2

TRACKSPV="1.1"
#MY_PV=${PV//./} #Quita el punto con bash


DESCRIPTION="Stunt Rally game with Track Editor, based on VDrift and OGRE."
HOMEPAGE="http://code.google.com/p/vdrift-ogre/"
SRC_URI="http://vdrift-ogre.googlecode.com/files/StuntRally-${PV}-sources.tar.bz2
         http://vdrift-ogre.googlecode.com/files/StuntRally-${PV}-data.tar.bz2
         http://vdrift-ogre.googlecode.com/files/StuntRally_v${TRACKSPV}_tracks2.7z"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND="
app-arch/p7zip
dev-games/ogre
"

RDEPEND="${DEPEND}"

#S=${WORKDIR}/S

src_compile(){
   cd StuntRally/cmake
   cmake ..
   emake || die
}

src_install(){
   newgamesbin  ${FILESDIR}/flare.sh flare.sh
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   doexe flare

   insinto ${GAMES_DATADIR}/${PN}
   doins -r  config enemies   fonts  images  items  maps  music  npcs  powers  soundfx  tilesetdefs || die "doins failed"
   dogamesdoc credits.html README.txt

   make_desktop_entry flare.sh Flare ${FILESDIR}/flare.png

   dodir /var/lib/flare/saves
   dosym /var/lib/flare/saves ${GAMES_DATADIR}/${PN}/saves
   fperms 770 /var/lib/flare/saves
   fowners games:games /var/lib/flare/saves

   prepgamesdirs
}
