# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Genera un documento pdf de una base de datos de películas"
HOMEPAGE=""
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/adodb-py
dev-texlive/texlive-latex
"

src_compile(){
	elog "Nothing to compile"
}

src_install(){
	dobin ${FILESDIR}/pdffilms
	insinto /usr/share/${PN}/
	doins ${FILESDIR}/pdffilms.sql
}
