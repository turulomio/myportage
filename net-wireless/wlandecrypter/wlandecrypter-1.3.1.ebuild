EAPI="2"
inherit autotools eutils

DESCRIPTION="Hacking wep"
SRC_URI="http://www.wifiway.org/archivos/${P}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
net-wireless/aircrack-ng
net-wireless/wepattack
"

RDEPEND=${DEPEND}

src_compile() {
        emake || die "make failed"
}

src_install () {
        dosbin wlandecrypter
}

