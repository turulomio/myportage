EAPI="1"
inherit autotools eutils

DESCRIPTION="An accounting web application, developed with mod_python and XUL"

SRC_URI="mirror://sourceforge/project/xulpymoney/xulpymoney-0.1.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"


DEPEND="
dev-db/postgresql-server
dev-python/adodb-py
sci-visualization/gnuplot
www-apache/mod_python
www-client/mozilla-firefox
www-servers/apache
"


S=${WORKDIR}/xulpymoney
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

