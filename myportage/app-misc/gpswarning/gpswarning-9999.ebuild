# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

IUSE=""
ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/gpswarning"
DESCRIPTION="Programa que avisa de radares"
HOMEPAGE=""
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"

DEPEND=""

src_compile(){
	elog "Nothing to compile"
}

src_install(){
	mv GPSWarning/main.py GPSWarning/gpswarning
	dobin GPSWarning/gpswarning
	insinto /usr/share/${PN}
	doins GPSWarning/radares.txt
}
