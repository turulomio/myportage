EAPI=7

PYTHON_COMPAT=( python{3_8,3_9,3_10} pypy )
inherit distutils-r1

DESCRIPTION="Sane and flexible OpenAPI 3 schema generation for Django REST framework."
HOMEPAGE="https://github.com/tfranzel/drf-spectacular"

SRC_URI="https://github.com/tfranzel/drf-spectacular/archive/refs/tags/0.24.2.zip -> ${P}.zip"

#S=${WORKDIR}/npyscreen-$COMMIT/
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/inflection
"


