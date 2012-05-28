# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit base games

DESCRIPTION="A general purpose, programmable physical simulator and renderer"
HOMEPAGE="http://www.nongnu.org/techne"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-games/ode
	dev-lang/lua
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/libpng
	media-libs/openal
	net-libs/libmicrohttpd
	net-libs/webkit-gtk
	sci-libs/plplot
	sys-devel/gcc[objc]
	virtual/opengl
	x11-libs/gtkglext"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README )

src_install() {
	base_src_install
	prepgamesdirs
}
