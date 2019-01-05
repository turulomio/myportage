EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )

inherit distutils-r1

DESCRIPTION="Generate your personal movie collection book "
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/Turulomio/mymoviebook/archive/mymoviebook-${PV}.tar.gz"
HOMEPAGE="https://github.com/Turulomio/mymoviebook"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86 amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/psycopg
app-text/texlive
"
S="${WORKDIR}/mymoviebook-mymoviebook-${PV}"
