# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="Strategy game"
HOMEPAGE="http://7kfans.com/"
SRC_URI="mirror://sourceforge/project/skfans/7KAA%20${PV}/7kaa-source-${PV}.tar.bz2
mirror://sourceforge/project/skfans/Seven%20Kingdoms%20AA%20Data%20Files/7kaa-data-2.13.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
media-libs/openal
media-libs/sdl-net
"

