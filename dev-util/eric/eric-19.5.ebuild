# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7


PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1




MY_P=${PN}6-${PV}
PYTHON_COMPAT=( python2_7 python3_{5,6,7} )
PYTHON_REQ_USE="sqlite,xml"
inherit python-single-r1 xdg-utils




DESCRIPTION="A full featured Python IDE using PyQt and QScintilla"
HOMEPAGE="https://eric-ide.python-projects.org/"
SRC_URI="mirror://sourceforge/eric-ide/${PN}6/stable/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="6"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

DEPEND="
	${PYTHON_DEPS}
	>=dev-python/sip-4.14.3[${PYTHON_USEDEP}]
	>=dev-python/PyQt5-5.7.1[gui,network,printsupport,sql,svg,widgets,${PYTHON_USEDEP}]
	dev-python/PyQtWebEngine
	>=dev-python/qscintilla-python-2.10[qt5(+),${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	|| (
		dev-python/PyQt5[help,webengine,${PYTHON_USEDEP}]
		dev-python/PyQt5[help,webkit,${PYTHON_USEDEP}]
	)
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	>=dev-python/coverage-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]
	dev-python/pyenchant[${PYTHON_USEDEP}]
	!dev-util/eric:4
	!dev-util/eric:5
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S=${WORKDIR}/${MY_P}

DOCS=( changelog README.rst THANKS )



SRC_URI="https://github.com/turulomio/officegenerator/archive/officegenerator-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/officegenerator"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-libs/libxml2
dev-python/openpyxl
dev-python/odfpy
"

S="${WORKDIR}/officegenerator-officegenerator-${PV}"





src_prepare() {
	default

	# Delete internal copies of dev-python/chardet and dev-python/pygments
	rm -fr eric/ThirdParty/{CharDet,Pygments} || die

	# Delete internal copy of dev-python/coverage
	rm -fr eric/DebugClients/Python{,3}/coverage || die
	sed -i -e 's/from DebugClients\.Python3\?\.coverage/from coverage/' \
		$(grep -lr 'from DebugClients\.Python3\?\.coverage' .) || die
}

src_install() {
	"${PYTHON}" install.py \
		-b "${EPREFIX}/usr/bin" \
		-d "$(python_get_sitedir)" \
		-i "${D}" \
		-c \
		-z \
		|| die

	python_optimize
	einstalldocs
}

pkg_postinst(){
	xdg_desktop_database_update

	if ! has_version dev-python/enchant; then
		elog "You might want to install dev-python/pyenchant for spell checking."
	fi
}

pkg_postrm() {
	xdg_desktop_database_update
}
