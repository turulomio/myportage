# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/sagan-rules/sagan-rules-999999999999.ebuild,v 1.1 2011/08/31 08:30:15 maksbotan Exp $

EAPI=3
inherit games git-2

MY_PV=${PV//./} 
DESCRIPTION="Free action roleplaying game"
HOMEPAGE="http://clintbellanger.net/rpg/"

EGIT_REPO_URI="git://github.com/clintbellanger/flare-game.git"

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
   sed -i 's:@FLARE_EXECUTABLE_PATH@:/usr/games/bin/flare:' distribution/flare.desktop.in
   mkdir build
   cd build
   cmake -DCMAKE_INSTALL_PREFIX:STRING="${D}/usr" ..
   emake || die
}


src_install(){
   cd build
   emake install || die
   mv ${D}/usr/games/flare ${D}/usr/games/bin/flare
   prepgamesdirs
}

