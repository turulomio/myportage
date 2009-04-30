# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/digenv/xut/packages/ebuild/xut-0.1.ebuild,v 1.1 2009/04/16 19:26:55 farpro Exp $

inherit games

MY_P="xut"
MY_PV="0_1_src"

DESCRIPTION="a button football game"
HOMEPAGE="http://xut.dnteam.org"
SRC_URI="mirror://sourceforge/digenv/${MY_P}_${MY_PV}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


RDEPEND="app-arch/bzip2
	app-arch/tar
	virtual/glu
	virtual/opengl
	media-libs/cal3d
	>=media-libs/freetype-2
	media-libs/libogg
	media-libs/libvorbis
	>=media-libs/libsdl-1.2.11
    media-libs/openal
	media-libs/sdl-image
	media-libs/sdl-ttf
	virtual/libintl"

DEPEND="${RDEPEND}
	sys-devel/gettext"

S=${WORKDIR}/${PN}

src_install() 
{
	dogamesbin bin/${PN} || die "dogamesbin failed"
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r data/* || die "doins failed"
	cd "${S}"/po
	make DESTDIR="${D}" install || "make po install failed"
	cd "${S}"
	doicon data/xut-icon.png
	make_desktop_entry xut XUT
	dodoc COPYING
	prepgamesdirs
}

