# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils multilib games

MY_PV="${PV}stable"

DESCRIPTION="OpenCity is a full 3D city simulator game project."
HOMEPAGE="http://www.opencity.info/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${MY_PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-libs/plib-1.8.4
	virtual/opengl
	virtual/glu
	virtual/glut
	media-libs/openal
	media-libs/freealut
	media-libs/sdl-net
	media-libs/sdl-image
	media-libs/libsdl"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-0.0.6stable

src_compile() {
	egamesconf \
		--datadir="${GAMES_DATADIR_BASE}" \
		|| die
	emake -j1 || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
#	newicon Ticon.png ${PN}.png
#	make_desktop_entry ${PN} TORCS
#	dodoc README.linux doc/history/history.txt
#	doman doc/man/*.6
#	dohtml -r doc/faq/faq.html doc/tutorials doc/userman
	prepgamesdirs
}
