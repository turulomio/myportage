# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/analog/analog-6.0.ebuild,v 1.12 2008/11/09 13:28:26 nixnut Exp $

inherit eutils

DESCRIPTION="YASAT (Yet Another Stupid Audit Tool) is a simple stupid audit tool."
HOMEPAGE="http://yasat.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""

S=${WORKDIR}/yasat

src_compile(){
        sed -i -e "s:/usr/local:/usr:" Makefile
}

src_install(){
        emake DESTDIR="${D}" install || die "emake install failed"
}
