# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils games

DESCRIPTION="super hero shoot em up"
HOMEPAGE="http://www.super-tirititran.com"
SRC_URI="mirror://sourceforge/${PN}/${PN}-09-linux-sources.tar.gz"
LICENSE="CCPL-Attribution-NonCommercial-NoDerivs-2.0"
SLOT="0"
KEYWORDS="~ppc ~x86"
IUSE=""

DEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer
	media-libs/sdl-ttf
	dev-libs/expat"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${PV}-gentoopath.diff || die "patch failed"
}

src_install() {
	dogamesbin supertirititran
	dodoc README
	insinto "${GAMES_DATADIR}"/"${PN}"
	doins -r data || die
	newicon "${FILESDIR}"/${PN}.png ${PN}.png
	make_desktop_entry ${PN} ${PN}
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
}
