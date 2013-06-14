# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
DESCRIPTION="sslstrip remove https and forwards http"
HOMEPAGE="http://www.thoughtcrime.org/software/sslstrip/"
SRC_URI="http://www.thoughtcrime.org/software/sslstrip/${P}.tar.gz"

inherit eutils python
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
	
RDEPEND=">=dev-lang/python-2.5"
	
	
src_compile() {
        einfo "Nothing to compile"
}
	
src_install() {
        dodir /usr/lib/"${PN}"
        insinto /usr/lib/"${PN}"
        doins sslstrip.py lock.ico
        dodir /usr/lib/${PN}/sslstrip
        insinto /usr/lib/${PN}/sslstrip
        doins sslstrip/*.py
        dosbin "${FILESDIR}/sslstrip"
        dodoc README COPYING
}

pkg_postinst() {
        python_mod_optimize
}

pkg_postrm() {
        python_mod_cleanup
}
