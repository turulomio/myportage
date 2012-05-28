# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games autotools

DESCRIPTION="cue sports simulator, aimed for physical accuracy and simplicity"
HOMEPAGE="http://www.nongnu.org/billiards/"
SRC_URI="http://savannah.nongnu.org/download/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-games/ode
        >=dev-lang/lua-5.1
	dev-games/techne
        media-libs/freetype:2
        media-libs/libpng
        media-libs/openal
        virtual/opengl"
RDEPEND="${DEPEND}"

src_prepare() {
        # Fix configure.ac for lua
        sed -i -e "s/lua5.1/lua/" \
                -e "s/luac\]\]/luac]/" configure.ac || die "sed failed"
        eautoreconf
}
