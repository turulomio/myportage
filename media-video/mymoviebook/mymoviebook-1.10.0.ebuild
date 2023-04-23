EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DISTUTILS_USE_PEP517=poetry

DESCRIPTION="Generate your personal movie collection book "
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/mymoviebook/archive/mymoviebook-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/mymoviebook"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-text/texlive
dev-python/colorama
dev-python/platformdirs
dev-python/psycopg
dev-python/python-decouple
dev-python/tqdm
dev-python/dj-database-url
"
S="${WORKDIR}/mymoviebook-mymoviebook-${PV}"
