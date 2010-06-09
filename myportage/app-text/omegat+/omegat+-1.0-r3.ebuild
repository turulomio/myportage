# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/omegat/omegat-1.8.1_p01.ebuild,v 1.1 2009/01/10 17:19:22 matsuu Exp $

EAPI=1
JAVA_PKG_BSFIX_NAME="build.xml build-impl.xml profiler-build-impl.xml"
inherit eutils java-pkg-2 java-ant-2

MY_P="OmegaT_${PV/_p/_}"
DESCRIPTION="Open source computer assisted translation (CAT) tool written in Java."
HOMEPAGE="http://www.omegatplus.org/"
SRC_URI="http://downloads.sourceforge.net/project/omegatplus/OmegaT+/1.0.M3.1/OmegaT+1.0.M3.1-src.7z"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jre-1.4
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/OmegaT+1.0.M3.1-src/"


src_compile() {
     	ant
}

src_install() {
	mkdir -p ${D}/usr/share/omegat+/localizations
        mkdir -p ${D}/usr/share/omegat+/icons
        cp omegatplus.jar ${D}/usr/share/omegat+/
        cp localizations/* ${D}/usr/share/omegat+/localizations
	cp -R icons/*  ${D}/usr/share/omegat+/icons/
	mkdir -p ${D}/usr/bin
	echo "#!/bin/bash" > ${D}/usr/bin/omegat+
        echo "java -jar /usr/share/omegat+/omegatplus.jar" >> ${D}/usr/bin/omegat+
        chmod 755 ${D}/usr/bin/omegat+
        chown root:root ${D}/usr/bin/omegat+

        java-pkg_jarinto "${JAVA_PKG_JARDEST}"
	java-pkg_dojar lib/*.jar

#	java-pkg_dolauncher ${PN} --jar omegatplus.jar

	docinto lib; dodoc lib/*.txt

	doicon images/OmegaT+.png
	make_desktop_entry ${PN} "OmegaT+" "OmegaT+" "Application;Office"
}
