EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )

inherit distutils-r1
DESCRIPTION="System to control who and when a group reads a document send by mail. It uses postgresql to store information"

IUSE=""
SRC_URI="https://github.com/Turulomio/didyoureadme/archive/didyoureadme-${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/didyoureadme"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${RDEPEND}
dev-python/psycopg
dev-python/PyQt5[printsupport,webengine,gui,widgets]
dev-python/pytz
"

S="${WORKDIR}/didyoureadme-didyoureadme-${PV}"
