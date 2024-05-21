# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod git-r3

DESCRIPTION="Driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter"
HOMEPAGE="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"
EGIT_REPO_URI="https://github.com/cilynx/rtl88x2bu.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ARCH=x86_64
MODULE_NAMES="88x2bu(net/wireless:)"
BUILD_TARGETS="clean modules"




################

CONFIG_CHECK="~!SPINLOCK JUMP_LABEL"

src_configure(){
einfo ${KV_OUT_DIR}
einfo ${KV_FULL}
}




src_compile() {
	KVER="${KV_FULL}" emake
#	local modlist=( {88x2bu}=net/wireless )
#	local modargs=( KERN_DIR="${KV_OUT_DIR}" KERN_VER="${KV_FULL}" )
#	linux-mod_src_compile
}

#src_install() {
#	linux-mod_src_install
#	insinto /usr/lib/modules-load.d/
#	newins "${FILESDIR}"/virtualbox.conf-r1 virtualbox.conf
#}
