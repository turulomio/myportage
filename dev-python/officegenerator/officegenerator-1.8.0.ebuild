EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1

DESCRIPTION="Python module to generate MS Office and LibreOffice files"

SRC_URI="https://github.com/Turulomio/officegenerator/archive/officegenerator-${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/officegenerator"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-libs/libxml2
>=dev-python/openpyxl-2.6.0
dev-python/odfpy
"

S="${WORKDIR}/officegenerator-officegenerator-${PV}"
