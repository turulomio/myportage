# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-mod

#COMMIT="ca0bcba405f8865e6acd6a6d3cacf93f7e1b8a2c"

DESCRIPTION="Realtek 8821(*U)/8811CU/8812A/8192E/8814A/8822B/8723(*U)/8188E(**) module for Linux kernel"
HOMEPAGE="https://github.com/morrownr/8821cu-20210118"
SRC_URI="https://github.com/morrownr/8821cu-20210118/archive/refs/heads/master.zip -> 8821cu-20210118-${PV}.zip"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"

DEPEND="virtual/linux-sources"

S="${WORKDIR}/8821cu-20210118-main"

MODULE_NAMES="8821cu(net/wireless)"
BUILD_TARGETS="all"

PATCHES=(
    "${FILESDIR}/bluetooth.patch"
)


pkg_setup() {
    linux-mod_pkg_setup
    BUILD_PARAMS="KERN_DIR=${KV_DIR} KSRC=${KV_DIR} KERN_VER=${KV_FULL} O=${KV_OUT_DIR} V=1 KBUILD_VERBOSE=1"
}

src_compile(){
    linux-mod_src_compile
}

src_install() {
    linux-mod_src_install
}

pkg_postinst() {
    linux-mod_pkg_postinst
}

