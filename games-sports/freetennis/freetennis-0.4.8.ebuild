# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic cvs games

DESCRIPTION="Tennis simulation focusing on realism and tactics"
HOMEPAGE="http://freetennis.sourceforge.net/"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
ECVS_SERVER="freetennis.cvs.sourceforge.net:/cvsroot/${PN}"
ECVS_MODULE=${PN}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="cvs"

DEPEND=">=dev-lang/ocaml-3.08.3
	>=dev-ml/camlimages-2.20
	>=dev-ml/lablgtk-2.4.0
	>=dev-ml/ocamlsdl-0.7.1
	>=media-libs/sdl-mixer-1.2.6
	>=media-libs/sdl-image-1.2.3-r1
	>=media-libs/sdl-ttf-2.0.7
	>=media-libs/sdl-gfx-2.0.13
	sys-libs/glibc
	sys-libs/zlib
	virtual/opengl
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXau
	x11-libs/libXcursor
	x11-libs/libXdmcp
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/pango"

dir=${GAMES_DATADIR}/${PN}

pkg_setup() {
	if ! built_with_use dev-ml/lablgtk opengl ; then
		die "opengl USE flag must be enabled in dev-ml/lablgtk"
	fi
}

src_unpack() {
	if use cvs ; then
		cvs_src_unpack
		mv -f "${WORKDIR}/${PN}" "${WORKDIR}/${P}"
	else
		unpack ${A}
	fi

	cd "${S}"

	sed -i \
		-e "s:+camlimages:/usr/lib/ocaml/site-packages/camlimages:" \
		-e "s:+lablGL:/usr/lib/ocaml/lablGL:" \
		-e "s:+lablgtk2:/usr/lib/ocaml/lablgtk2:" \
		-e "s:+sdl:/usr/lib/ocaml/site-packages/sdl:" \
		Makefile || die "sed Makefile failed"

	sed -i \
		-e "s:let sfxDir = \"sfx\":let sfxDir = \"${dir}/sfx\":" \
		-e "s:let gfxDir = \"graphics\":let gfxDir = \"${dir}/graphics\":" \
		${PN}.ml || die "sed ${PN}.ml failed"
}

src_install() {
	insinto "${dir}"
	doins -r graphics sfx || die "doins failed"

	dogamesbin ${PN} || die "dogamesbin failed"
	make_desktop_entry "${PN} -newbie" "Free Tennis (newbie)"

	dodoc AUTHORS TODO.txt
	dohtml web-site/*.html

	prepgamesdirs
}
