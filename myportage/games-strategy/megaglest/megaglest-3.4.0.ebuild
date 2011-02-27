# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Made by LlulluTuqo
# $Header: /var/cvsroot/gentoo-x86/games-strategy/glest/glest-3.2.2.ebuild,v 1.9 2010/08/15 21:03:02 ssuominen Exp $

EAPI=2
inherit eutils wxwidgets games cmake-utils

DESCRIPTION="Cross-platform 3D realtime strategy game"
HOMEPAGE="http://www.glest.org/"
SRC_URI="http://sourceforge.net/projects/${PN}/files/${PN}-source-3.4.0.tar.bz2
	http://sourceforge.net/projects/${PN}/files/${PN}-data-3.4.0.7z"

LICENSE="GPL-2 glest-data"
SLOT="0"
#only tested in 32 bits plataform
KEYWORDS="amd64 x86"

RDEPEND="media-libs/libsdl[joystick,video]
	media-libs/libogg
	media-libs/libvorbis
	media-libs/openal
	>dev-libs/xerces-c-3
	>=net-misc/curl-7.21.0[static-libs]
	virtual/opengl
	virtual/glu
	dev-lang/lua
	x11-libs/libX11
	x11-libs/wxGTK:2.8[X]"
DEPEND="${RDEPEND}
	app-arch/p7zip"

#	|| ( >=dev-libs/xerces-c-3[icu] >=dev-libs/xerces-c-3[-icu,-iconv] )

S=${WORKDIR}/${PN}-source-${PV}

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-gentoo.patch 
	sed -i \
	-e "s:@GENTOO_DATADIR@:${GAMES_DATADIR}/${PN}:" \
	source/glest_game/main/main.cpp \
	|| die "sed failed"

	sed -i \
	-e '/Lang/s:\.lng::' \
	glest.ini \
	|| die "sed failed"

	#find "${WORKDIR}"/glest_game -name Thumbs.db -exec rm -f '{}' +
}

src_configure() {
	cd ${S}
	WX_GTK_VER=2.8
	need-wxwidgets unicode

#	egamesconf \
#		--with-vorbis=/usr \
#		--with-ogg=/usr 
	cmake -DWANT_SVN_STAMP=OFF ./
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	cd "${S}"
	insinto "${GAMES_DATADIR}"/${PN}
	doins glest.ini || die "doins glest.ini failed"

	cd "${WORKDIR}"
	doins glestkeys.ini || die "doins glestkeys.ini failed"

	doins -r  servers.ini \
		data maps scenarios techs tilesets tutorials || die "doins data failed"
	dodoc docs/README || die "dodoc docs/readme.txt failed"

	cd "${S}"
	dogamesbin mk/linux/glest.bin || die "dogamesbin glest.bin failed"
	mv mk/linux/glest_editor mk/linux/megaglest_editor 
	dogamesbin mk/linux/megaglest_editor|| die "dogamesbin glest_editor failed"
	dogamesbin mk/linux/glest_g3dviewer || die "dogamesbin glest_g3dviewer failed"
	dogamesbin mk/linux/glest_configurator || die "dogamesbin glest_configurator failed"

	cd "${WORKDIR}"

	newicon techs/megapack/factions/magic/units/archmage/images/archmage.bmp \
		${PN}.bmp || die "newicon failed"
	make_desktop_entry glest.bin MegaGlest /usr/share/pixmaps/${PN}.bmp
	prepgamesdirs
}
