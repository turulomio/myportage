EAPI=8
PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Script to save and url in a single file with an automatic and structured name. It uses monolith as its backend"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/save_url/archive/save_url-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/save_url"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/poetry-core
dev-python/colorama
dev-python/mechanize
www-apps/monolith
"

RDEPEND="${PYTHON_DEPS}"


S="${WORKDIR}/save_url-save_url-${PV}"

