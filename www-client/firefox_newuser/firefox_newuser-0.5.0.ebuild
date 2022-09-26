EAPI=7
DESCRIPTION="Script to launch firefox in a recently created user. It deletes user after closing firefox"
HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
www-client/firefox
"

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"
