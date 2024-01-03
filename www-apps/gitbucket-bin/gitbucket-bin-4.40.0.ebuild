# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An open-source git service"
HOMEPAGE="https://github.com/gitbucket/gitbucket"
SRC_URI="https://github.com/gitbucket/gitbucket/releases/download/${PV}/gitbucket.war -> gitbucket-${PV}.war"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
acct-user/gitbucket
dev-java/openjdk
"

DEPEND="${RDEPEND}"


src_unpack() {
    mkdir -p ${S}
    cp "${DISTDIR}/${A}" "${S}"
}

src_install() {
	dodir usr/lib/gitbucket

	insinto usr/lib/gitbucket
	newins gitbucket-${PV}.war gitbucket.war

	newinitd "${FILESDIR}/gitbucket.initd" gitbucket
	newconfd "${FILESDIR}/gitbucket.conf" gitbucket
}
