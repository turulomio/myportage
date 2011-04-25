# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

DESCRIPTION="The Xenophis, a Vulcan exploratory vessel, has incidentally found the mythical sector of Firia where the planets, only reachable through warp tunnels, are told to be made of staggering ice and liquid fire."
HOMEPAGE="http://www.vertigo-game.com/"
SRC_URI="http://www.vertigo-game.com/downloads/latest/linux/Vertigo.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT=0

DEPEND="
sci-physics/bullet
"
RDEPEND="${DEPEND}"

