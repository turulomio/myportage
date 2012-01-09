# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
DESCRIPTION="Script que detecta las conexiones ssh en el sistema y genera avisos"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
app-accessibility/espeak[portaudio]
>=dev-lang/python-3.0.0
dev-python/pyinotify
net-misc/openssh"

src_install(){
	exeinto /etc/init.d/
	newexe ${FILESDIR}/sshadvice.initd sshadvice
        newbin ${FILESDIR}/sshadvice.py sshadvice
}

