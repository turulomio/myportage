inherit subversion autotools eutils

DESCRIPTION="Scripts de traducción de ficheros odt"
HOMEPAGE="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/odttranslate"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/odttranslate"

DEPEND="
<dev-lang/python-3.0.0
app-office/libreoffice
"
RDEPEND=${DEPEND}


src_compile(){
	elog "Nothing to compile"
}

src_install(){
	elog ${D}
        emake DESTDIR="${D}" install || die "Install failed"
}

