EAPI=7

inherit desktop rpm xdg

DESCRIPTION="Spanish government's electronic signature PKCS11 for FNMT DNIE"
HOMEPAGE="https://www.sede.fnmt.gob.es/en/stceres"
SRC_URI="https://www.sede.fnmt.gob.es/documents/10445900/10816753/libpkcs11-fnmtdnie-1.6.1_Fedora_33_64bits.rpm"

LICENSE="|| ( GPL-2+ EUPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
app-crypt/ccid
sys-apps/pcsc-lite
sys-apps/pcsc-tools
"
BDEPEND=""

S=${WORKDIR}


src_install(){
    doins -r *
}

src_insatall(){
    dolib.so usr/lib64/libpkcs11-fnmtdnie-asn1skeletons.so.0.0.0
    dolib.so usr/lib64/libpkcs11-fnmtdnie-asn1.so.0.0.0
    dolib.so usr/lib64/libpkcs11-fnmtdnie-cryptopp.so.0.0.0
    dolib.so usr/lib64/libpkcs11-fnmtdnie.so


    cd usr/lib64
    dosym libpkcs11-fnmtdnie-asn1skeletons.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-asn1skeletons.so
    dosym libpkcs11-fnmtdnie-asn1.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-asn1.so
    dosym libpkcs11-fnmtdnie-cryptopp.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-cryptopp.so
    dosym libpkcs11-fnmtdnie-asn1skeletons.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-asn1skeletons.so.0
    dosym libpkcs11-fnmtdnie-asn1.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-asn1.so.0
    dosym libpkcs11-fnmtdnie-cryptopp.so.0.0.0 /usr/lib64/libpkcs11-fnmtdnie-cryptopp.so.0
    
    cd 

}

pkg_postinst() {
    elog "To use fnmtdnie you must:"
    elog "  * To make usb card gadget work"
    elog "    - Read https://wiki.gentoo.org/wiki/PCSC-Lite"
    elog "    - Init /etc/init.d/pcscd start or rc-update add pcscd default"
    elog "  * To make firefox use fnmtdnie"
    elog "    - https://www.dnielectronico.es/PDFs/Familia_Mozilla.pdf"
    elog "If that fails, please report bugs upstream."
}
