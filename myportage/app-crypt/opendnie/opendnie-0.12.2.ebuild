# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Driver OpenDNIe para el DNI electrónico"
HOMEPAGE="http://opendnie.cenatic.es"
SRC_URI="http://forja.cenatic.es/frs/download.php/1332/opensc-opendnie-0.12.2.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
!dev-libs/opensc
sys-apps/pcsc-lite
app-crypt/ccid
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/opensc-${PV}"

src_compile() {
   econf --prefix=/usr \
      --sysconfdir=/etc \
      --datadir=/usr/share \
      --infodir=/usr/share/info \
      --mandir=/usr/share/man || die "Could not configure"
   emake || die "Emake failed"
}

src_install() {
   emake DESTDIR=${D} install || die "make failed"
} 
