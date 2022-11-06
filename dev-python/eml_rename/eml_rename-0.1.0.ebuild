EAPI=7

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

DESCRIPTION="Script renames all eml files in a directory using mail metadata"

SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/tqdm
dev-python/colorama
dev-python/chardet
"
