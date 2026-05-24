EAPI=8
PYTHON_COMPAT=( python3_{10..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Script to launch firefox in a recently created user"
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
www-client/firefox
dev-python/colorama
dev-python/psutil
dev-python/tqdm
"