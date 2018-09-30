

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1 python-r1
DESCRIPTION="GC_Office"
HOMEPAGE="https://gc_office.com"

ESVN_REPO_URI="svn://10.52.188.177/GC_Office"
ESVN_USER="guest"
ESVN_PASSWORD="guested"


IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
>=dev-python/officegenerator-1.2.0
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
