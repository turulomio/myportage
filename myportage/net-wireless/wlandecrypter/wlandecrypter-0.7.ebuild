EAPI="2"
inherit autotools eutils

DESCRIPTION="Hacking wep"
SRC_URI="http://www.fileden.com/files/2008/10/11/2138272/wlandecrypter-0.7.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
net-wireless/aircrack-ng
"

RDEPEND=${DEPEND}

src_compile() {
        emake || die "make failed"
}

src_install () {
        dosbin wlandecrypter
}

