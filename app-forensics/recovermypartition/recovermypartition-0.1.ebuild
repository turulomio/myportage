# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit  autotools eutils

IUSE=""
SRC_URI="mirror://sourceforge/project/recovermypartit/recovermypartit-0.1.tar.gz"
DESCRIPTION="Makes forensics from a partition"
HOMEPAGE="http://recovermypartition.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86"

DEPEND="
app-forensics/sleuthkit
app-forensics/foremost
"
S=${WORKDIR}/recovermypartit

RDEPEND="${DEPEND}"

src_compile(){
        cd po
        bash translate
}

src_install(){
        mkdir -p ${D}/usr/bin
        mkdir -p ${D}/usr/share/locale/en/LC_MESSAGES/
        mkdir -p ${D}/usr/share/locale/es/LC_MESSAGES/
        mkdir -p ${D}/usr/share/recovermypartition/

	cp recovermypartition.py ${D}/usr/bin/recovermypartition
        cp po/en.mo ${D}/usr/share/locale/en/LC_MESSAGES/recovermypartition.mo
        cp po/es.mo ${D}/usr/share/locale/es/LC_MESSAGES/recovermypartition.mo
        cp INSTALL RELEASES GPL-3.txt ${D}/usr/share/recovermypartition/
}
