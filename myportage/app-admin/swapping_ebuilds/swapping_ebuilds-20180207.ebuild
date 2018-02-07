# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""
DESCRIPTION="Detects swapping ebuilds and log them in /var/lib/"
HOMEPAGE=""
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/psutil
"

src_compile(){
	true
}

src_install(){
        dobin ${FILESDIR}/swapping_ebuilds
}
