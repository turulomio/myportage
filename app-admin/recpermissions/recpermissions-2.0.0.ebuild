EAPI=8
PYTHON_COMPAT=( python3_{13,14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Script to change permissions and owner recursivily from current directory"
LICENSE="GPL-3"


IUSE=""
SRC_URI="https://github.com/Turulomio/recpermissions/archive/recpermissions-v${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/recpermissions"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
"
S="${WORKDIR}/recpermissions-recpermissions-v${PV}"
