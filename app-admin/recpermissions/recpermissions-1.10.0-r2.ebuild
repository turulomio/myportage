EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )

inherit distutils-r1

DESCRIPTION="Script to change permissions and owner recursivily from current directory"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/recpermissions/archive/recpermissions-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/recpermissions"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
"
S="${WORKDIR}/recpermissions-recpermissions-v${PV}"
