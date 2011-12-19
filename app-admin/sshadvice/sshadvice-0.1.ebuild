# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Script que detecta las conexiones ssh en el sistema y genera avisos"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/pyinotify
net-misc/openssh"

src_install(){
	exeinto /etc/init.d/
	newexe ${FILESDIR}/sshadvice.initd sshadvice
        newbin ${FILESDIR}/sshadvice.py sshadvice
}

