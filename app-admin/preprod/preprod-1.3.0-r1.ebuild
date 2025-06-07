EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Easily creation of pre-production and production scripts to automate your deployment"
LICENSE="GPL-3"
HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
"
