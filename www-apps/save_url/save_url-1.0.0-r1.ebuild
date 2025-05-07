EAPI=8



DESCRIPTION="Script to save and url in a single file with an automatic and structured name. It uses monolith as its backend"
LICENSE="GPL-3"

IUSE=""
SRC_URI="https://github.com/turulomio/save_url/archive/save_url-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/save_url"

DISTUTILS_USE_PEP517=standalone


SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
dev-python/poetry-core
dev-python/colorama
dev-python/mechanize
www-apps/monolith
"


PYTHON_COMPAT=( python3_{10..13} pypy )

inherit distutils-r1

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"


S="${WORKDIR}/save_url-save_url-${PV}"

