EAPI=8
PYTHON_COMPAT=( python3_{10..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Module to use dictionaries, list of dictionaries and other data structures"
HOMEPAGE="https://github.com/turulomio/pydicts"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

# 1. Definimos la USE flag
IUSE="pylatex"

# 2. Ajustamos las dependencias
# Nota: Generalmente estas librerías son RDEPEND (necesarias en tiempo de ejecución)
RDEPEND="
	${PYTHON_DEPS}
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/isodate[${PYTHON_USEDEP}]
	pylatex? ( dev-python/pylatex[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"