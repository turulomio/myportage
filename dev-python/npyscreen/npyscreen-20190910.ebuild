EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} pypy )
inherit distutils-r1

COMMIT="8ce31204e1de1fbd2939ffe2d8c3b3120e93a4d0"
DESCRIPTION="ncurses widgets"
HOMEPAGE="https://github.com/npcole/npyscreen"

SRC_URI="https://github.com/npcole/npyscreen/archive/$COMMIT.zip -> ${P}.zip"


S=${WORKDIR}/npyscreen-$COMMIT/
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"


