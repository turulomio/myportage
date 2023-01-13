EAPI=7

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

DESCRIPTION="Store model history and view/revert changes from admin site. "
HOMEPAGE="https://github.com/jazzband/django-simple-history"

SRC_URI="https://github.com/jazzband/django-simple-history/archive/refs/tags/3.2.0.tar.gz -> ${P}.tar.gz"

#S=${WORKDIR}/npyscreen-$COMMIT/
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
"


