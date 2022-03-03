# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-mod git-r3

DESCRIPTION="Driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter"
HOMEPAGE="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"
#EGIT_REPO_URI="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959.git"
EGIT_REPO_URI="https://github.com/cilynx/rtl88x2bu.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ARCH=x86_64
MODULE_NAMES="88x2bu(net/wireless:)"
BUILD_TARGETS="clean modules"
