# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Mariano Muñoz

EAPI=2

inherit eutils autotools

DESCRIPTION="Rar password cracker"
HOMEPAGE="http://rarcrack.sourceforge.net/"
SRC_URI="mirror://sourceforge/rarcrack/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


src_compile() {
#	sed -i -e "s:0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ;,._-¿?!¡:" rarcrack.h
	emake || die "emake failed"
}

src_install() {
        dobin rarcrack || die "dobin failed"
}
