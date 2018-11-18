EAPI=6
inherit java-pkg-2 java-ant-2 java-utils-2

VERS="${PV:0:5}" #5 first 3.6.0
UPDATE="${PV:7:2}" #update 10
MY_P="OmegaT_${PV/_p/_}" #replaced p

DESCRIPTION="Open source computer assisted translation (CAT) tool written in Java."
HOMEPAGE="http://www.omegat.org/"
SRC_URI="mirror://sourceforge/omegat/OmegaT%20-%20Standard/OmegaT%20${VERS}%20update%20${UPDATE}/${MY_P}_Source.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=virtual/jdk-1.4"
S=${WORKDIR}
src_install() {
	java-pkg_dojar dist/*.jar
	dosym /usr/share/doc/${PF}/html "${JAVA_PKG_JARDEST}"/docs

	java-pkg_jarinto "${JAVA_PKG_JARDEST}"/lib
	java-pkg_dojar dist/lib/*.jar

	java-pkg_dolauncher ${PN} --jar OmegaT.jar

	dodoc release/changes.txt release/readme*.txt
	dohtml -A properties -r docs/*
	docinto lib; dodoc lib/*.txt

	doicon images/OmegaT.png
	make_desktop_entry ${PN} "OmegaT" "OmegaT" "Application;Office"
}

