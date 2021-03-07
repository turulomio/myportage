EAPI=7

PYTHON_COMPAT=( python{3_7,3_8,3_9} pypy )
inherit distutils-r1

DESCRIPTION="A Python API for Dolt"
HOMEPAGE="https://github.com/dolthub/doltpy"

SRC_URI="https://github.com/dolthub/doltpy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/wheel
"
RESTRICT="test"
src_configure(){
#    sed -i -e "s/find_packages()/['doltpy',]/" setup.py
#    sed -i "18d" setup.py
#    sed -i "18d" setup.py
    cat setup.py
}

