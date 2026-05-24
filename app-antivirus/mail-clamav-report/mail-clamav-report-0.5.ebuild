# Copyright 1999-2011 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Script que envia por correo el analisis del disco duro"
HOMEPAGE="https://github.com/turulomio/mail-clamav-report"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	mail-client/mailme
	app-antivirus/clamav
"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	dobin "${FILESDIR}"/mail-clamav-report
	dobin "${FILESDIR}"/clamav-report
}
