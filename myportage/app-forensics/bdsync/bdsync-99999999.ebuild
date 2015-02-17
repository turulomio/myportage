# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/rsyslog/rsyslog-8.6.0.ebuild,v 1.2 2014/12/28 14:45:29 titanofold Exp $

EAPI=5
inherit git-r3

DESCRIPTION="An enhanced multi-threaded syslogd with database support and more"
HOMEPAGE="http://www.rsyslog.com/"
EGIT_REPO_URI="https://github.com/TargetHolding/bdsync.git"
KEYWORDS="amd64 x86"

LICENSE="GPL-3 LGPL-3 Apache-2.0"
SLOT="0"

RDEPEND="
sys-apps/util-linux"
DEPEND="${RDEPEND}"


src_unpack() {
		git-r3_fetch
		git-r3_checkout
}


#src_configure() {
#}

#src_compile() {
#}

src_install() {
    doman bdsync.1
    dobin bdsync
    dobin $FILESDIR/bdsync-local
}

