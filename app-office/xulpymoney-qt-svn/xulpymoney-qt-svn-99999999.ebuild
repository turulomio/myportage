# Copyright 1999-2010 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion autotools eutils

ESVN_REPO_URI="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/pyqt"



IUSE=""
DESCRIPTION="Accounting system with xulpymoney-qt support"
HOMEPAGE="http://xulpymoney.sourceforge.net"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="x86"

DEPEND="
dev-db/postgresql-server
dev-python/adodb-py
dev-python/PyQt4
"

RDEPEND="${DEPEND}"


src_compile(){
        cd po; bash ./translate;cd ..

        pyrcc4 xulpymoney-qt/images/xulpymoney-qt.qrc > xulpymoney-qt/images/xulpymoney-qt_rc.py
        pyuic4 xulpymoney-qt/ui/frmAbout.ui > xulpymoney-qt/ui/Ui_frmAbout.py
        pyuic4 xulpymoney-qt/ui/frmAccess.ui > xulpymoney-qt/ui/Ui_frmAccess.py
        pyuic4 xulpymoney-qt/ui/frmAnalisis.ui > xulpymoney-qt/ui/Ui_frmAnalisis.py
        pyuic4 xulpymoney-qt/ui/frmMain.ui > xulpymoney-qt/ui/Ui_frmMain.py
        pyuic4 xulpymoney-qt/ui/wdgInversiones.ui > xulpymoney-qt/ui/Ui_wdgInversiones.py
        cd xulpymoney-qt;pylupdate4 xulpymoney-qt.pro;lrelease xulpymoney-qt.pro;
}

src_install(){
        dodir /usr/share/locale/en/LC_MESSAGES/
	dodir /etc/xulpymoney-qt
	dodir /usr/lib/xulpymoney-qt
	dodir /usr/share/xulpymoney-qt/sql

	insinto /etc/xulpymoney-qt
	newins config.py config.py.dist

        newbin xulpymoney-qtd.py xulpymoney-qtd
	newbin xulpymoney-qt/xulpymoney-qt.py xulpymoney-qt

	exeinto /etc/init.d/
	newexe xulpymoney-qt.initd xulpymoney-qt

	insinto /usr/share/locale/en/LC_MESSAGES/
	newins po/en.mo xulpymoney-qt.po

	dodoc GPL-3.txt CHANGELOG-* AUTHORS-* RELEASES-* doc/xulpymoney-qt-* 

	insinto /usr/lib/xulpymoney-qt
	doins xulpymoney-qt/i18n/*.qm
	doins xulpymoney-qt/images/*.py
	doins xulpymoney-qt/ui/*.py

	insinto /usr/share/xulpymoney-qt/sql
	doins sql/xulpymoney-qt.*

        cp xulpymoney-qt/images/kmplot.jpg xulpymoney-qt.jpg
        doicon xulpymoney-qt.jpg
        make_desktop_entry xulpymoney-qt "xulpymoney-qt" /usr/share/pixmaps/xulpymoney-qt.jpg


}
