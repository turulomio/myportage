# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="External dependencies for moneymoney and django_moneymoney"
SLOT="0"

KEYWORDS="amd64 arm arm64 ~loong ppc64 ~riscv x86 ~x64-macos"
RDEPEND="
	net-libs/nodejs[inspector]
"
