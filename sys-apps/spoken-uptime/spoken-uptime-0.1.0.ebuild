# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EUSE="5"
DESCRIPTION="Speak system uptime"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"


IUSE=""
SRC_URI="mirror://sourceforge/project/spoken-uptime/spoken-uptime/${PV}/spoken-uptime-${PV}.tar.gz"

DEPEND="
app-accessibility/espeak
"


src_compile(){
        ewarn "Nothing to compile"
}

src_install(){
        emake DESTDIR="${D}" install || die "Install failed"
}

