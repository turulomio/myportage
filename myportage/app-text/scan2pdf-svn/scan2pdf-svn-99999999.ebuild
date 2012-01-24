inherit subversion autotools eutils

DESCRIPTION="Genera un pdf con un escaneo"
HOMEPAGE="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/scan2pdf"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/scan2pdf"

DEPEND="
app-text/tesseract
app-text/texlive
media-gfx/imagemagick"
RDEPEND=${DEPEND}

src_install () {
	dobin scan2pdf
}
