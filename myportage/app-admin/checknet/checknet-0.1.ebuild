# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Script para relanzar la red si pierde internet"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND=""

src_install(){
	dobin ${FILESDIR}/checknet
#	dosym /usr/bin/checknet /etc/local.d/checknet.start
}
