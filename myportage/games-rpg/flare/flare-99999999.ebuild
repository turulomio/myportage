# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/sagan-rules/sagan-rules-999999999999.ebuild,v 1.1 2011/08/31 08:30:15 maksbotan Exp $

EAPI=3
inherit games git-2

MY_PV=${PV//./} 
#Quita el punto con bash


DESCRIPTION="Free action roleplaying game"
HOMEPAGE="http://clintbellanger.net/rpg/"

EGIT_REPO_URI="git://github.com/clintbellanger/flare.git"

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

S=${WORKDIR}/flare_src_v${MY_PV}

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
#   doins -r  config enemies   fonts  images  items  maps  music  npcs  powers  soundfx  tilesetdefs || die "doins failed"
   doins -r art_src mods tiled
   dogamesdoc credits.html README.txt

   make_desktop_entry flare.sh Flare ${FILESDIR}/flare.png

   dodir /var/lib/flare/saves
   dosym /var/lib/flare/saves ${GAMES_DATADIR}/${PN}/saves
   fperms 770 /var/lib/flare/saves
   fowners games:games /var/lib/flare/saves

   prepgamesdirs
}
