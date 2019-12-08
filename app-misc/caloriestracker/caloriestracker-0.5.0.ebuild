EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1

DESCRIPTION="Calories tracker system"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/caloriestracker/archive/caloriestracker-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/caloriestracker"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${RDEPEND}
dev-python/npyscreen
dev-python/psycopg
dev-python/PyQt5[printsupport,gui,widgets]
dev-python/pytz
dev-python/PyQtChart
dev-python/PyQtWebEngine
dev-python/colorama
dev-python/officegenerator
"

S="${WORKDIR}/caloriestracker-caloriestracker-${PV}"
