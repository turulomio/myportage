# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

IUSE=""
ESVN_REPO_URI="svn://svn.code.sf.net/p/xulpymoney/code/navit-mytools"
DESCRIPTION="Utilidades para navit"
HOMEPAGE=""
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="app-misc/navit-svn
media-sound/sox"

src_compile(){
	elog "Nothing to compile"
}

src_install(){
	dodir /usr/share/navit/maps
	dobin *
}
