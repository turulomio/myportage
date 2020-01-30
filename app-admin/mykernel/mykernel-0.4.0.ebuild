EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8} pypy )

inherit distutils-r1

DESCRIPTION="My gentoo kernel compilation script"
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
app-arch/cpio
dev-python/pytz
sys-fs/cryptsetup
sys-fs/e2fsprogs
sys-apps/util-linux
"
