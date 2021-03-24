EAPI=7

PYTHON_COMPAT=( python{3_7,3_8,3_9} pypy )
inherit distutils-r1

DESCRIPTION="Converts a PDF file to LibreOffice Writer document"

SRC_URI="https://github.com/turulomio/pdf2odt/archive/pdf2odt-${PV}.tar.gz"
HOMEPAGE="https://github.com/turulomio/pdf2odt"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
app-text/poppler
app-text/tesseract
dev-python/colorama
dev-python/odfpy
dev-python/officegenerator
dev-python/pillow
dev-python/tqdm
"

S="${WORKDIR}/pdf2odt-pdf2odt-${PV}"
