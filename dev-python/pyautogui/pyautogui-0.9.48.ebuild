EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1

COMMIT="737192e18878aa81d922b592c99e32073aee0f54"
DESCRIPTION="
A cross-platform GUI automation Python module for human beings. Used to programmatically control the mouse & keyboard"
HOMEPAGE="https://github.com/asweigart/pyautogui"

SRC_URI="https://github.com/asweigart/pyautogui/archive/$COMMIT.zip -> ${P}.zip"


S=${WORKDIR}/${PN}-$COMMIT/
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
dev-python/python-xlib
"

DEPEND="${RDEPEND}"


