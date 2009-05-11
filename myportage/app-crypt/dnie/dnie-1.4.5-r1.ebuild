inherit autotools eutils

DESCRIPTION="opensc-dni installation"
HOMEPAGE="http://www.dnielectronico.es/descargas/PKCS11_para_Sistemas_Unix/distribuciones_linux.html"
SRC_URI="http://www.dnielectronico.es/descargas/PKCS11_para_Sistemas_Unix/opensc-dnie-1.4.5-1.fc9.i386_Fedora_9.rpm.tar"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"


DEPEND="
"
RDEPEND=${DEPEND}

src_install() {
	cd ${WORKDIR}
	rpm2targz opensc-dnie-1.4.5-1.fc9.i386_Fedora_9.rpm
	cd ${D}
	tar xvzf  ${WORKDIR}/opensc-dnie-1.4.5-1.fc9.i386_Fedora_9.tar.gz
}

