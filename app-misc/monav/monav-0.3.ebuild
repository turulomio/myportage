# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit  autotools eutils

IUSE=""
SRC_URI="http://monav.googlecode.com/files/${P}.tar.gz"
DESCRIPTION="Routing map"
HOMEPAGE="http://monav.googlecode.com"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
x11-libs/qt-mobility
"

RDEPEND="${DEPEND}"

src_compile(){
qmake monavclient.pro
emake 
}

