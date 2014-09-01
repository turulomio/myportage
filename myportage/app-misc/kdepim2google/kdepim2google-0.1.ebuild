# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils
SRC_URI="mirror://sourceforge/project/kdepim2google/kdepim2google/${PV}/kdepim2google-src-${PV}.tar.gz"
DESCRIPTION="Utils to integrate kdepim information to google."
HOMEPAGE="http://sourceforge.net/projects/kdepim2google/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"


DEPEND="
dev-qt/qtcore
"

S="${WORKDIR}/kdepim2google"

#src_configure() {
#	mkdir build
#	cd build
#	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
#}

#src_install () {
#	cd build
#	emake DESTDIR="${D}" install || die "Install failed"
#	cp navit/navit.xml ${D}/usr/share/navit/navit.xml.dist
#}

