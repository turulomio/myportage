# Copyright 1999-2018 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
DESCRIPTION="Remove innecesary files finding datetime patterns in filename"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
>=dev-lang/python-3.0.0
dev-python/colorama
"

src_compile(){
	einfo "Nothing to compile"
}

src_install(){
	python3 Makefile.py --install ${D}
}

