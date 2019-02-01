EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1
DESCRIPTION="Remove innecesary files finding datetime patterns in filename"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/renamebyreplace/archive/renamebyreplace-${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/renamebyreplace"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
"
S="${WORKDIR}/renamebyreplace-renamebyreplace-${PV}"
