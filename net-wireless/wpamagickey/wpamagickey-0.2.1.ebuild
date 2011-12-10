# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils

DESCRIPTION="Generador de claves wpa para Wlan_XXXX, Jazztel_XXXX."
HOMEPAGE="http://www.seguridadwireless.net"
SRC_URI="http://www.bitsdelocos.es/SW/WPAmagickey-${PV}.tar.gz"
IUSE=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"

S="${WORKDIR}/WPAmagickey-${PV}"

src_unpack() {
    tar xf /usr/portage/distfiles/${A}
}

src_install() {
	dobin wpamagickey
	dodoc leeme.txt
}

