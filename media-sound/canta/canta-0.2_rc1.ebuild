# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games eutils

DESCRIPTION="Its goal is to provide a platform for playing and creating songs and singing to them into a microphone."
HOMEPAGE="http://www.canta-game.org/"
SRC_URI="http://cgit.canta-game.org/cgit.cgi/canta/snapshot/canta-0.2-rc1.tar.gz
http://cgit.canta-game.org/cgit.cgi/canta-media/snapshot/canta-media-0.2-rc1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND=${DEPEND}

S=${WORKDIR}/canta-0.2-rc1
src_compile() {
	emake || die "Fallo el econf"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	prepgamesdirs
}

