# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

HOMEPAGE="http://turulomio.users.sourceforge.net"
DESCRIPTION="Script que envia un correo rapidamente desde consola"
LICENSE="GPL-3"
SRC_URI=""

IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

S=${WORKDIR}/${P}

src_unpack(){
	mkdir -p "${S}"
}

src_install(){
	insinto "/etc/mailme"
	doins "${FILESDIR}/mailme.cfg.dist"
	dobin "${FILESDIR}/mailme"
	dobin "${FILESDIR}/mailmework"
}
