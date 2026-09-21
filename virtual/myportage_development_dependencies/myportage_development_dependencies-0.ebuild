# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dependencies for local development and QA in myportage overlay"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ppc64 ~riscv x86"

RDEPEND="
	app-portage/gentoolkit
	app-portage/portage-utils
	dev-util/pkgcheck
	dev-util/pkgdev
	dev-vcs/git
	net-misc/rsync
"
