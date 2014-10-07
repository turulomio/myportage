# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils autotools subversion
ESVN_REPO_URI="https://navit.svn.sourceforge.net/svnroot/navit/trunk/navit"
DESCRIPTION="An open-source vector based car navigation system with a routing engine."
HOMEPAGE="http://www.navit-project.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"


DEPEND="
sci-geosciences/gpsd
"

src_prepare(){
	epatch "${FILESDIR}"/coordsearch.patch
}

src_configure() {
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

src_install () {
	cd build
	emake DESTDIR="${D}" install || die "Install failed"
	cp navit/navit.xml ${D}/usr/share/navit/navit.xml.dist
}

