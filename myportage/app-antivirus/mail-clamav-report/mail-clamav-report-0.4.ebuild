# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Script que envia por correo el analisis del disco duro"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
app-antivirus/clamav
"

src_install(){
	dobin ${FILESDIR}/mail-clamav-report
}
