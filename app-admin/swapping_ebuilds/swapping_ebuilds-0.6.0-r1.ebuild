EAPI=7
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="It's a script to detect swapping compiling ebuilds in Gentoo. With this tool you can detect swapping in computers with small RAM to try to improve its compilation time "
LICENSE="GPL-3"

HOMEPAGE="https://github.com/turulomio/${PN}"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

DISTUTILS_USE_SETUPTOOLS=rdepend
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/colorama
dev-python/humanize
dev-python/psutil
"
