EAPI=7

inherit desktop rpm xdg

DESCRIPTION="Spanish government's electronic signature PKCS11"
HOMEPAGE="https://www.dnielectronico.es"
SRC_URI="https://www.dnielectronico.es/descargas/distribuciones_linux/${P}-1.x86_64.rpm"

LICENSE="|| ( GPL-2+ EUPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
sys-apps/pcsc-lite
sys-apps/pcsc-tools
"
BDEPEND=""

S=${WORKDIR}

src_install(){
    dolib.so usr/lib64/libpkcs11-dnie-asn1skeletons.so.0.0.0
    dolib.so usr/lib64/libpkcs11-dnie-asn1.so.0.0.0
    dolib.so usr/lib64/libpkcs11-dnie-cryptopp.so.0.0.0
    dolib.so usr/lib64/libpkcs11-dnie.so


    cd usr/lib64
    dosym libpkcs11-dnie-asn1skeletons.so.0.0.0 /usr/lib64/libpkcs11-dnie-asn1skeletons.so
    dosym libpkcs11-dnie-asn1.so.0.0.0 /usr/lib64/libpkcs11-dnie-asn1.so
    dosym libpkcs11-dnie-cryptopp.so.0.0.0 /usr/lib64/libpkcs11-dnie-cryptopp.so
    dosym libpkcs11-dnie-asn1skeletons.so.0.0.0 /usr/lib64/libpkcs11-dnie-asn1skeletons.so.0
    dosym libpkcs11-dnie-asn1.so.0.0.0 /usr/lib64/libpkcs11-dnie-asn1.so.0
    dosym libpkcs11-dnie-cryptopp.so.0.0.0 /usr/lib64/libpkcs11-dnie-cryptopp.so.0

}

pkg_postinst() {
    elog "To use dnie you must:"
    elog "  * To make usb card gadget work"
    elog "    - Maybe you need to use -udev libusb if your card gadget is not recognized"
    elog "    - Init /etc/init.d/pcscd start or rc-update add pcscd default"
    elog "  * To make firefox use dnie"
    elog "    - https://www.dnielectronico.es/PDFs/Familia_Mozilla.pdf"
    elog "If that fails, please report bugs upstream."
}
