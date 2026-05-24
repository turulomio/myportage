# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A 2D platform game with a focus on exploration and puzzle solving"
HOMEPAGE="https://github.com/riksweeney/edgar"
SRC_URI="https://github.com/riksweeney/edgar/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	media-libs/libsdl[joystick]
	media-libs/sdl-mixer
	media-libs/sdl-image
	media-libs/sdl-ttf
	media-libs/sdl-net
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_prepare() {
	default
	sed -i -e 's/Exec=edgar/Exec=\/usr\/games\/edgar/' icons/edgar.desktop || die
}
