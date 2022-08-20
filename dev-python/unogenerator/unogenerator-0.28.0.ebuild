EAPI=7

PYTHON_COMPAT=( python{3_8,3_9,3_10} pypy )
inherit distutils-r1

DESCRIPTION="Python module to generate documents using Libreoffice API"

SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-office/libreoffice
dev-python/tqdm
dev-python/colorama
dev-python/humanize
dev-python/polib
dev-python/psutil
dev-python/pytz
media-gfx/imagemagick
"
