# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils games subversion

DESCRIPTION=""
HOMEPAGE="http://ta3d.sourceforge.net/"
ESVN_REPO_URI="http://ta3d.darkstars.co.uk/TA3D/trunk"
LICENSE="GPL-2"
SLOT="1"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-libs/allegro-4.2
	>=media-libs/allegrogl-0.4.0
	media-libs/fmod:1"
DEPEND="${RDEPEND}
	app-arch/p7zip"


S=${WORKDIR}/ta3d

src_unpack() {
	subversion_src_unpack
}

src_compile() {
        cd ${S}
        cmake .
	emake || die "emake failed"
}

src_install(){
	cd ${S}
        emake install
}
