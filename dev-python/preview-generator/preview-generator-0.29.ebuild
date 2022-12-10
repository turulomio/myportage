EAPI=7

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

DESCRIPTION="Generates previews of files with cache management"
HOMEPAGE="https://github.com/algoo/preview-generator"

SRC_URI="https://github.com/algoo/preview-generator/archive/refs/tags/release_${PV}.zip"

S=${WORKDIR}/preview-generator-release_${PV}/
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


PATCHES=(
    "${FILESDIR}/remove_test.patch"
)


REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
dev-python/python-magic
dev-python/ffmpeg-python
dev-python/wand
dev-python/filelock
"



#pyexifinfo falta
