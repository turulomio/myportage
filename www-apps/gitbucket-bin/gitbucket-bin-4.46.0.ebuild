# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An open-source git service"
HOMEPAGE="https://github.com/gitbucket/gitbucket"
SRC_URI="https://github.com/gitbucket/gitbucket/releases/download/${PV}/gitbucket.war -> gitbucket-${PV}.war"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}/${P}"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	acct-user/gitbucket
	virtual/jre
"

src_unpack() {
	mkdir -p "${S}" || die
	cp "${DISTDIR}/${A}" "${S}" || die
}

src_install() {
	insinto /usr/lib/gitbucket
	newins gitbucket-${PV}.war gitbucket.war

	newinitd "${FILESDIR}/gitbucket.initd" gitbucket
	newconfd "${FILESDIR}/gitbucket.conf" gitbucket
}
