# Copyright 1999-2014 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit subversion autotools eutils

ESVN_REPO_URI="https://svn.code.sf.net/p/xulpymoney/code/xulpymoney"


IUSE=""
DESCRIPTION="Accounting system with automatic quotes support"
HOMEPAGE="http://xulpymoney.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/psycopg
dev-python/matplotlib[qt5]
dev-python/PyQt5[printsupport,webkit]
dev-python/pytz
"

RDEPEND="${DEPEND}"


src_compile(){
        emake compile || die "Error compiling"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
