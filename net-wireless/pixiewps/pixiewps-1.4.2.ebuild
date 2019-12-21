EAPI=7

IUSE=""
SRC_URI="https://github.com/wiire-a/pixiewps/archive/v${PV}.tar.gz -> pixiewps-${PV}.tar.gz"
HOMEPAGE="https://github.com/wiire-a/pixiewps"

DESCRIPTION="Pixiewps is a tool written in C used to bruteforce offline the WPS pin exploiting the low or non-existing entropy of some APs (pixie dust attack)."

LICENSE="GPL-3+"
SLOT="0"
IUSE="openssl"
KEYWORDS="~x86 ~amd64"

RDEPEND="openssl? ( dev-libs/openssl )"

src_prepare() {
        sed -i 's:/usr/local:/usr:' Makefile || die "sed Makefile failed"
        eapply_user
}

src_compile() {
	if use openssl ; then
	  emake OPENSSL=1
	 else
	  emake
	fi
}

src_install() {
        default
        doman pixiewps.1
}
