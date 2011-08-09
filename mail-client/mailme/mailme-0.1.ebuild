# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Script que envia un correo rapidamente desde consola"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86"

DEPEND=""

src_install(){
	insinto /etc/mailme
	doins ${FILESDIR}/*.cfg.dist
	dobin ${FILESDIR}/mailme
}
