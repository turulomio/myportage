# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EUSE="5"
DESCRIPTION="Scripts para sincronizar portage, reconstruir el sistema y imagen de inicio"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND=""

src_install(){
	dobin ${FILESDIR}/e*
	dobin ${FILESDIR}/m*
}
