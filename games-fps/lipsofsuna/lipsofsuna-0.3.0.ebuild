# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="Lips of Suna is a tongue-in-cheek dungeon crawl game."
HOMEPAGE="http://lipsofsuna.org"
SRC_URI="mirror://sourceforge/project/lipsofsuna/lipsofsuna/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
net-libs/enet
sci-physics/bullet
"
RDEPEND="${DEPEND}"


src_compile(){
   ./waf configure
   ./waf build
}

src_install(){
   newgamesbin  ${FILESDIR}/lipsofsuna.sh lipsofsuna.sh
   exeopts -m0750
   exeinto ${GAMES_DATADIR}/${PN}
   newexe .build/lipsofsuna lipsofsuna

   insinto ${GAMES_DATADIR}/${PN}
   doins -r  data  || die "doins failed"

#   newicon data/tracks/00/minimap.png motogt.png
   make_desktop_entry motogt.sh MotoGT
# /usr/share/pixmaps/motogt.png

   prepgamesdirs
}
