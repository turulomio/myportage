EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )

inherit distutils-r1

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
dev-python/unogenerator
dev-python/psycopg
"
S="${WORKDIR}/mymoviebook-mymoviebook-${PV}"
