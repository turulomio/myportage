EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="My emerge sync procedure"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-portage/gentoolkit
dev-util/ccache
dev-python/colorama
dev-python/pycryptodome
"
