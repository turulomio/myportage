# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils games

MY_PN=${PN/b-gone/src}

DESCRIPTION="a 3D physics platform game - won the grand prize in the 10th annual CS 248 video game competition!"
HOMEPAGE="http://cs.stanford.edu/people/mbostock/polly/"
SRC_URI="http://graphics.stanford.edu/~mbostock/${MY_PN}.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	virtual/opengl
	media-libs/sdl-image
	media-libs/glew
	media-libs/freeglut
	dev-util/tinyxml
	media-libs/sdl-mixer"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_PN}

src_prepare(){
	epatch "${FILESDIR}"/"${PV}"-libs.patch \
		"${FILESDIR}"/"${PV}"-Makefile.patch
	sed -i \
		-e "s:resources/:"${GAMES_DATADIR}"/"${PN}"/resources/:" \
		resource.cpp || die "sed failed"
}

src_install() {
	dogamesbin ${PN} || die "dogamesbin failed"

	insinto "${GAMES_DATADIR}"/"${PN}"
	doins -r resources || die "doins failed"

	newicon "${FILESDIR}"/"${PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "${PN}"
	dodoc README* || die
	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst
}
