EAPI=8
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Change permissions and owner recursively from current directory"
HOMEPAGE="https://github.com/Turulomio/recpermissions"
SRC_URI="https://github.com/Turulomio/recpermissions/archive/recpermissions-v${PV}.tar.gz"
S="${WORKDIR}/recpermissions-recpermissions-v${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
