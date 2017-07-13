# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

IUSE=""
ESVN_REPO_URI="svn://svn.code.sf.net/p/xulpymoney/code/navit-mytools"
DESCRIPTION="My tools for navit"
HOMEPAGE=""
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
app-accessibility/espeak
app-misc/navit
dev-python/psutil
media-sound/sox
net-analyzer/netcat
"

src_compile(){
	ewarn "Nothing to compile"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}
