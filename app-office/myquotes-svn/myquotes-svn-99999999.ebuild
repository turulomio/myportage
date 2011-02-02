# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

ESVN_REPO_URI="https://myquotes.svn.sourceforge.net/svnroot/myquotes"



IUSE=""
DESCRIPTION="Financials quotes from open source pages in Internet"
HOMEPAGE="http://myquotes.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86"

DEPEND="
dev-db/postgresql-server
dev-python/pyqwt
dev-python/pytz

"

RDEPEND="${DEPEND}"


src_compile(){
        cd po; bash ./translate;cd ..

        pyrcc4 myquotes/images/myquotes.qrc > myquotes/images/myquotes_rc.py
        pyuic4 myquotes/ui/frmAbout.ui > myquotes/ui/Ui_frmAbout.py
        pyuic4 myquotes/ui/frmAccess.ui > myquotes/ui/Ui_frmAccess.py
        pyuic4 myquotes/ui/frmAnalisis.ui > myquotes/ui/Ui_frmAnalisis.py
        pyuic4 myquotes/ui/frmMain.ui > myquotes/ui/Ui_frmMain.py
        pyuic4 myquotes/ui/wdgInversiones.ui > myquotes/ui/Ui_wdgInversiones.py
        cd myquotes;pylupdate4 myquotes.pro;lrelease myquotes.pro;
}

src_install(){
        dodir /usr/share/locale/en/LC_MESSAGES/
	dodir /etc/myquotes
	dodir /usr/lib/myquotes

	insinto /etc/myquotes
	newins config.py config.py.dist

        newbin myquotesd.py myquotesd
	newbin myquotes/myquotes.py myquotes

	exeinto /etc/init.d/
	newexe myquotes.initd myquotes

	insinto /usr/share/locale/en/LC_MESSAGES/
	newins po/en.mo myquotes.po

	dodoc GPL-3.txt CHANGELOG-* AUTHORS-* RELEASES-* doc/myquotes-* 

	insinto /usr/lib/myquotes
	doins myquotes/i18n/*.qm
	doins myquotes/images/*.py
	doins myquotes/ui/*.py

}
