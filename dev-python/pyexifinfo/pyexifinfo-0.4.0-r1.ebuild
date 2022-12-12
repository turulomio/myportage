EAPI=7

PYTHON_COMPAT=( python{3_9,3_10,3_11} pypy )
inherit distutils-r1

DESCRIPTION="Yet another wrapper for Phil Harvey's Exiftool "
HOMEPAGE="https://github.com/guinslym/pyexifinfo"

SRC_URI="https://files.pythonhosted.org/packages/d5/57/7d90277921541ff7113ec1de13b7163f9b85abe43f905a9f94420ecdd528/pyexifinfo-0.4.0.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
media-libs/exiftool
"


