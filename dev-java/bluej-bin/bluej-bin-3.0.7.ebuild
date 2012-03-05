# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

MY_PN="${PN/-bin}"
MY_PV="${PV//.}"
MY_P="${MY_PN}-${MY_PV}"

DOC_PV="2.0.1"

DESCRIPTION="An integrated Java environment for introductory teaching."
HOMEPAGE="http://bluej.org/"
SRC_URI="http://bluej.org/download/files/${MY_P}.jar
	doc? ( http://bluej.org/download/files/${MY_PN}-ref-manual.pdf
		http://bluej.org/tutorial/tutorial-${DOC_PV//.}.pdf
			-> ${MY_PN}-tutorial-${DOC_PV}.pdf
		http://bluej.org/tutorial/testing-tutorial.pdf
			-> ${MY_PN}-testing-tutorial.pdf )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc examples"

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jdk-1.4"

S="${WORKDIR}"

src_unpack(){
	unpack ${MY_P}.jar
	unzip -qq "${S}"/${MY_PN}-dist.jar -d "${S}" || die "failed to unzip the .jar"
}

src_compile(){
	einfo 'nothing to compile.'
}

src_install(){
	insinto /usr/share/${PN}
	doins -r lib icons

	dodir /etc
	mv "${D}"/{usr/share/${PN}/lib,etc}/${MY_PN}.defs
	dosym /{etc,usr/share/${PN}/lib}/${MY_PN}.defs

	dodoc THIRDPARTYLICENSE.txt
	insinto /usr/share/doc/${PF}
	use examples && doins -r examples
	use doc && doins "${DISTDIR}"/${MY_PN}-*.pdf

	echo "#!/bin/sh" > bluej
	echo "APPBASE=\"/usr/share/${PN}\"" >> bluej
	echo 'JAVAPATH="$(java-config -O)"' >> bluej
	echo 'CP="$APPBASE/lib/bluej.jar:$JAVAPATH/lib/tools.jar"' >> bluej
	echo '"$JAVAPATH/bin/java" -cp "$CP" bluej.Boot  "$@"' >> bluej
	dobin bluej

	make_desktop_entry ${PN} Blue-J
}
