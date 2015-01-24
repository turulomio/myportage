# Copyright 1999-2015 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EUSE="5"
DESCRIPTION="Makes a webcam snapshot from console"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-lang/python
dev-python/pygame
"

src_install(){
	dobin ${FILESDIR}/webcam-snapshot
}
