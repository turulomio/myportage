# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit games

MY_P="dccnitghtmare"
MY_PV="0.7"

DESCRIPTION="a sarcastic 3D single player RPG"
HOMEPAGE="http://dnt.dnteam.org"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-${MY_PV}.tar.bz2"

LICENSE="GPL-3"
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
	doins bin/dcc.opc bin/options.cfg || die "doins failed"
	cd "${S}"/po
	make DESTDIR="${D}" install || "make po install failed"
	cd "${S}"
	doicon data/dnt-icon.png
	make_desktop_entry dccnitghtmare DccNiTghtmare
	dodoc README COPYING
	prepgamesdirs
}

