EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} pypy )
inherit distutils-r1

DESCRIPTION=""

SRC_URI="https://github.com/turulomio/translate_odf/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/translate_odf"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/translate-toolkit
"

S="${WORKDIR}/${P}"
