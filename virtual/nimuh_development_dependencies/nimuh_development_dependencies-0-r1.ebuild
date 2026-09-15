# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dependencies to compile and install nimuh"
SLOT="0"

KEYWORDS="amd64 arm arm64 ~loong ppc64 ~riscv x86 ~x64-macos"
RDEPEND="
	app-arch/makeself
	dev-util/mingw64-toolchain
"
