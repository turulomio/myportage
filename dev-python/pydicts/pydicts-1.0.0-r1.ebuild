EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Module to use dictionaries, list of dictionaries and other data structures "
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
dev-python/tabulate
dev-python/pylatex
dev-python/isodate
"
