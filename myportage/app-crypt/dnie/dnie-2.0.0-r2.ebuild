inherit autotools eutils

DESCRIPTION="opensc-dni installation"
HOMEPAGE="http://www.dnielectronico.es/descargas/PKCS11_para_Sistemas_Unix/distribuciones_linux.html"
SRC_URI="http://www.dnie.es/descargas/PKCS11_para_Sistemas_Unix/distribuciones_linux/Fedora_Beefy_opensc-dnie-2.0.0-2.x86_64.rpm"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"


DEPEND="
dev-libs/opensc
"
RDEPEND=${DEPEND}

src_install() {
	cd ${WORKDIR}
	rpm2targz Fedora_Beefy_opensc-dnie-2.0.0-2.x86_64.rpm
	cd ${D}
	tar xvzf  ${WORKDIR}/opensc-dnie-1.4.5-1.fc9.i386_Fedora_9.tar.gz
	elog "Ejecute /usr/share/opensc-dnie/inst_pkcs11_cert.pl"


}

