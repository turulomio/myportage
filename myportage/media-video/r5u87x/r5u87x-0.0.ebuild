# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod mercurial

MY=${WORKDIR}/${PN}
DESCRIPTION="A bunch of userspace tools to help manage cameras based on Ricoh R5U87x chipsets."
HOMEPAGE="http://bitbucket.org/ahixon/r5u87x/"

IUSE=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"

CONFIG_CHECK="USB VIDEO_DEV VIDEO_V4L1_COMPAT"
#MODULE_NAMES="r5u87x(usb:${MY})"
BUILD_TARGETS="all"

EHG_REPO_URI="http://bitbucket.org/ahixon/r5u87x/"


src_unpack() {
        mercurial_src_unpack
}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="KDIR=${KV_DIR}"
}

src_compile(){
	cd ${MY}
	emake|| die "emake"
	mv loader r5u87x-loader
}

src_install() {
	cd ${MY}
#	linux-mod_src_install

	insinto /usr/sbin
	dosbin 	r5u87x-loader
	dodoc README

	insinto  /etc/udev/rules.d/
	doins contrib/90-r5u87x-loader.rules.in

	insinto /usr/lib/r5u87x/ucode/
	doins ucode/*.fw #r5u870_1810.fw r5u870_1830.fw r5u870_1832.fw r5u870_1833.fw r5u870_1834.fw r5u870_1835.fw r5u870_1836.fw r5u870_1870.fw r5u870_1870_1.fw
}
