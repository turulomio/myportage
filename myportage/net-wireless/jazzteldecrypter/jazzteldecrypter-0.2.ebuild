EAPI="2"
inherit autotools eutils

DESCRIPTION="Hacking wep"
SRC_URI="http://www.fileden.com/files/2008/10/11/2138272/jazzteldecrypter.c"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
net-wireless/aircrack-ng
net-wireless/wepattack
"

RDEPEND=${DEPEND}

src_unpack() {
	cp /usr/portage/distfiles/${A} ${WORKDIR}
}

src_compile() {
        gcc jazzteldecrypter.c -o jazzteldecrypter
}

src_install () {
        dosbin jazzteldecrypter
}

