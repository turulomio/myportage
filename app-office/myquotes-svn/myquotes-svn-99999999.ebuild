# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

ESVN_REPO_URI="https://myquotes.svn.sourceforge.net/svnroot/myquotes"



IUSE=""
DESCRIPTION="Financials quotes from open source pages in Internet"
HOMEPAGE="http://myquotes.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-db/postgresql-server
dev-python/psycopg
dev-python/pyqwt
dev-python/pytz
dev-python/PyQt4
"

RDEPEND="${DEPEND}"


src_compile(){
	emake compile || die "Error compiling"
}

src_install(){
	emake DESTDIR="${D}" install || die "Install failed"
}
