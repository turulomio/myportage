# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit  autotools eutils

IUSE=""
SRC_URI="mirror://sourceforge/project/recovermypartit/recovermypartit-${PV}.tar.gz"
DESCRIPTION="Makes forensics from a partition"
HOMEPAGE="http://recovermypartition.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86"

DEPEND="
app-forensics/sleuthkit
app-forensics/foremost
"
S=${WORKDIR}/recovermypartit-${PV}

RDEPEND="${DEPEND}"

src_compile(){
        cd po
        bash translate
}

src_install(){
        mkdir -p ${D}/usr/bin
        mkdir -p ${D}/usr/share/locale/en/LC_MESSAGES/
        mkdir -p ${D}/usr/share/locale/fr/LC_MESSAGES/
        mkdir -p ${D}/usr/share/locale/md/LC_MESSAGES/
        mkdir -p ${D}/usr/share/locale/ru/LC_MESSAGES/
        mkdir -p ${D}/usr/share/recovermypartition/

	cp recovermypartition.py ${D}/usr/bin/recovermypartition
        chmod 755  ${D}/usr/bin/recovermypartition
        cp po/en.mo ${D}/usr/share/locale/en/LC_MESSAGES/recovermypartition.mo
        cp po/fr.mo ${D}/usr/share/locale/fr/LC_MESSAGES/recovermypartition.mo
        cp po/md.mo ${D}/usr/share/locale/md/LC_MESSAGES/recovermypartition.mo
        cp po/ru.mo ${D}/usr/share/locale/ru/LC_MESSAGES/recovermypartition.mo
        cp INSTALL-ES.txt  INSTALL-EN.txt RELEASES-ES.txt RELEASES-EN.txt CHANGELOG-ES.txt CHANGELOG-EN.txt GPL-3.txt ${D}/usr/share/recovermypartition/
}
