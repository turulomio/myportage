# Copyright 1999-2015 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EUSE="5"
DESCRIPTION="Scripts to conect to bluenmea in a device, and launch gpsd"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="sci-geosciences/gpsd"

src_install(){
	exeinto /etc/init.d/
	newexe ${FILESDIR}/bluenmea-client.initd bluenmea-client
	insinto /etc/conf.d/
	newins ${FILESDIR}/bluenmea-client.conf bluenmea-client
}
