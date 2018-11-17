# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Nimuh is a game about Andalucía"
HOMEPAGE="http://www.nimuh.com/"
SRC_URI="mirror://sourceforge/project/nimuh/nimuh%201.02/Nimuh%20SRC%20%28Data%29/nimuh-data-1.02.tar.gz"

LICENSE="Creative commons"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-mixer
	media-libs/sdl-image
	dev-libs/expat"
DEPEND="${RDEPEND}"

src_install() {
	make DESTDIR="${D}" install
}
