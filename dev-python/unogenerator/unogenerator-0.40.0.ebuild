EAPI=7

PYTHON_COMPAT=( python3_{9..12} )
inherit distutils-r1

DESCRIPTION="Python module to generate documents using Libreoffice API"

DISTUTILS_USE_PEP517=poetry

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
dev-python/poetry-core
dev-python/polib
dev-python/psutil
>=dev-python/pydicts-0.13.0
dev-python/pytz
media-gfx/imagemagick
"
