EAPI="7"

inherit cmake-utils

#ABI_X86="64"
SRC_URI="https://github.com/turulomio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/turulomio/${PN}"
LICENSE="GPL-3"
DESCRIPTION="Utils to integrate kdepim information to google."
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="
dev-qt/qtcore
"

src_configure(){
    ## Installs in lib64 directory
    sed -i -e 's/LIBDIR "lib"/LIBDIR "lib64"/' src/CMakeLists.txt
    cmake-utils_src_configure
}
