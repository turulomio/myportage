EAPI="1"
inherit subversion autotools eutils

DESCRIPTION="An accounting web application, developed with mod_python and XUL"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/xulpymoney"

DEPEND="
dev-db/postgresql-server
dev-python/adodb-py
dev-python/formencode
www-apache/mod_python
www-servers/apache
"

src_unpack() {
        subversion_src_unpack
}

src_compile(){
	elog "Nada para compilar"
}

src_install () {
	elog "${D}"
        emake DESTDIR="${D}" install || die "install failed"
	elog "Debes instalar apache para que lea psp:"
	elog "  - Modifica /etc/conf.d/apache2"
	elog "  - Modifica apache"
	elog "Debes instalar la base de datos con el comando"

}

