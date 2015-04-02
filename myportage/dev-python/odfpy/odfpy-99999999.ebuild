# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/rsyslog/rsyslog-8.6.0.ebuild,v 1.2 2014/12/28 14:45:29 titanofold Exp $

EAPI=5



PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4} )
inherit git-r3
inherit distutils-r1



DESCRIPTION="ODFPY for python 3"
HOMEPAGE="https://pypi.python.org/pypi/pyodf"

LICENSE="Apache-2.0 GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


EGIT_REPO_URI="https://github.com/georgesk/odfpy.git"

DEPEND="
"
RDEPEND=""




python_test() {
        local exit_status=0 test
        for test in tests/test*.py; do
                einfo "Running ${test} ..."
                "${PYTHON}" "${test}"
                [[ $? -ne 0 ]] && exit_status=1
        done
        return ${exit_status}
}


src_unpack() {
		git-r3_fetch
		git-r3_checkout
}


#src_configure() {
#}

#src_compile() {
#}


