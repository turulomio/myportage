# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/xalan/xalan-2.7.1.ebuild,v 1.7 2011/05/03 18:38:49 grobian Exp $

EAPI=1

inherit java-pkg-2 java-ant-2 eutils versionator

DESCRIPTION="Java ODF playing"
HOMEPAGE="http://www.jopendocument.org"
SRC_URI="http://www.jopendocument.org/download/jOpenDocument-src-1.3b1.zip"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="
dev-java/itext
>=dev-java/junit-4
"
S=${WORKDIR}

src_compile() {
	ant -Dbuild_java_home=/usr 

}

src_install() {
	dobin ${FILESDIR}/bluej
	insinto /usr/share/bluej/
	doins -r lib examples icons
	newicon icons/bluej-vista.ico bluej.ico                                                                                                                                              
   	make_desktop_entry bluej BlueJ /usr/share/pixmaps/bluej.ico   
#	java-pkg_dojar lib/${PN}.jar
	# installs symlinks to the file in /usr/share/xalan-serializer
#	java-pkg_dojar build/serializer.jar
	# and records it to package.env as if it belongs to this one's
	# classpath, for maximum possible backward compatibility
#	java-pkg_regjar $(java-pkg_getjar xalan-serializer serializer.jar)

#	java-pkg_dolauncher ${PN} --main org.apache.xalan.xslt.Process
}
