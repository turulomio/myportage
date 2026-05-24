EAPI=8
PYTHON_COMPAT=( python3_{11..15} )
DISTUTILS_USE_PEP517="poetry"
inherit distutils-r1

DESCRIPTION="Config parser with the ability to obfuscate keys with rotated bits"
HOMEPAGE="https://github.com/turulomio/configparser_rb"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-python/pydicts
"
