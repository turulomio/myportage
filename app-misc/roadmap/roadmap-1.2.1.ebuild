# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

IUSE=""

SRC_URI="mirror://sourceforge/roadmap/${P}-src.tar.gz"

DESCRIPTION="RoadMap provides street mapping functionality using a GPS reciever"
HOMEPAGE="http://roadmap.sourceforge.net/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"

DEPEND="x11-libs/gtk+
	media-gfx/imagemagick
	app-misc/gpsdrive"

S=${WORKDIR}/${PN}-${PV}/src

#src_unpack() {
#	cd ${S}
#}

src_compile() {
	cd ${S}
	INSTALLDIR="/usr" emake || die "error autoconf"
}

src_install() {
	insinto /usr/share/pixmaps; doins icons/*.png 
	insinto /usr/bin; dobin rdmghost dumpmap buildplace buildus rdmxchange rdmfriends rdmtrace rdmkismet buildmap_osm buildmap gtk2/gtkroadmap gtk2/gtkroadgps
	insinto /usr/share/roadmap/; doins sprites preferences session drivers roadmap.popup roadmap.screenobjects
        insinto /usr/bin/; dobin "${FILESDIR}/roadmap-update-spain.sh"
        insinto /usr/share/roadmap/default/; doins default/All
}
