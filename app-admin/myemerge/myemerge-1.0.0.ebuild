EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1
DISTUTILS_USE_PEP517=standalone

DESCRIPTION="My emerge sync procedure"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DISTUTILS_USE_SETUPTOOLS=rdepend
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-portage/gentoolkit
dev-util/ccache
dev-python/colorama
dev-python/pycryptodome
dev-python/poetry-core
"
