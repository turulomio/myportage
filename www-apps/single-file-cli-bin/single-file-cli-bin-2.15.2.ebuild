# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CLI tool to save complete web pages as a single HTML file"
HOMEPAGE="https://github.com/gildas-lormeau/single-file-cli"
URI_PREFIX="https://github.com/gildas-lormeau/single-file-cli/releases/download/v${PV}"
SRC_URI="
	amd64? ( ${URI_PREFIX}/single-file-x86_64-linux -> ${P}-amd64 )
	arm64? ( ${URI_PREFIX}/single-file-aarch64-linux -> ${P}-arm64 )
"

S="${WORKDIR}"
LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"
RESTRICT="strip"

QA_PREBUILT="usr/bin/single-file"

RDEPEND="
	www-client/google-chrome
"

src_unpack() {
	default
	if use amd64; then
		cp "${DISTDIR}/${P}-amd64" "${WORKDIR}/single-file" || die
	elif use arm64; then
		cp "${DISTDIR}/${P}-arm64" "${WORKDIR}/single-file" || die
	fi
}

src_install() {
	dobin "${WORKDIR}/single-file"
	dosym single-file /usr/bin/single-file-cli
}
