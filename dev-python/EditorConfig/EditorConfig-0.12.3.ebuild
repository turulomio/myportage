EAPI=7

PYTHON_COMPAT=( python{3_8,3_9,3_10} pypy )
inherit distutils-r1

DESCRIPTION="EditorConfig File Locator and Interpreter for Python"

SRC_URI="https://files.pythonhosted.org/packages/13/31/8382c65fb54ef19b8335f8e05e9ed9f62e33122f9619d989a151cc7e5152/EditorConfig-0.12.3.tar.gz"
HOMEPAGE="http://editorconfig.org/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DISTUTILS_USE_SETUPTOOLS="rdepend"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
"

pkg_postinst(){
    einfo "DIRTY: Rename /usr/bin/editorconfig from app-text/editorconfig-core-c before installing this to /usr/bin/editorconfig2"
}