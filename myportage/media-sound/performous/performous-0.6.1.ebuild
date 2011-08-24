# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit  cmake-utils
DESCRIPTION="Performous is a free cross-platform singing game"
HOMEPAGE="http://performous.org/"
SRC_URI="mirror://sourceforge/performous/performous/${PV}/Performous-${PV}-Source.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"
RDEPEND=${DEPEND}

S=${WORKDIR}/Performous-${PV}-Source/

src_compile() {
	cd _build
	emake
}

src_install() {
	cd _build
	emake DESTDIR="${D}" install || die "emake install failed"
}



