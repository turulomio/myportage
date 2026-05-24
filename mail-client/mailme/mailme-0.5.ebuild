# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Script que envia un correo rapidamente desde consola"
HOMEPAGE="https://github.com/turulomio/mailme"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

S="${WORKDIR}/${P}"

src_unpack() {
	mkdir -p "${S}" || die
}

src_install() {
	dobin "${FILESDIR}/mailme"
}
