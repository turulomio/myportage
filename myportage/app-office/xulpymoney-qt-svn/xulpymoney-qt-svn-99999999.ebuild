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
KEYWORDS="x86 amd64"

DEPEND="
dev-db/postgresql-server
dev-python/adodb-py
dev-python/PyQt4
"

RDEPEND="${DEPEND}"


src_compile(){
        pyrcc4 images/xulpymoney.qrc > images/xulpymoney_rc.py
        pyuic4 ui/frmAbout.ui > ui/Ui_frmAbout.py 
        pyuic4 ui/frmAccess.ui > ui/Ui_frmAccess.py 
        pyuic4 ui/frmMain.ui > ui/Ui_frmMain.py
        pyuic4 ui/frmOperCuentas.ui > ui/Ui_frmOperCuentas.py
        pyuic4 ui/frmTablasAuxiliares.ui > ui/Ui_frmTablasAuxiliares.py
        pyuic4 ui/wdgBancos.ui > ui/Ui_wdgBancos.py
        pyuic4 ui/wdgCuentas.ui > ui/Ui_wdgCuentas.py
        pyuic4 ui/frmCuentasIBM.ui > ui/Ui_frmCuentasIBM.py                        
        pyuic4 ui/wdgInformeClases.ui > ui/Ui_wdgInformeClases.py
        pyuic4 ui/wdgInformeHistorico.ui > ui/Ui_wdgInformeHistorico.py
        pyuic4 ui/wdgInformeDividendos.ui > ui/Ui_wdgInformeDividendos.py
        pyuic4 ui/wdgAPR.ui > ui/Ui_wdgAPR.py
        pyuic4 ui/wdgIndexRange.ui > ui/Ui_wdgIndexRange.py
        pyuic4 ui/wdgInversiones.ui > ui/Ui_wdgInversiones.py
        pyuic4 ui/frmInversionesEstudio.ui > ui/Ui_frmInversionesEstudio.py
        pyuic4 ui/frmInversionesIBM.ui > ui/Ui_frmInversionesIBM.py
        pyuic4 ui/frmTransferencia.ui > ui/Ui_frmTransferencia.py
        pyuic4 ui/wdgTotal.ui > ui/Ui_wdgTotal.py
        pylupdate4 xulpymoney.pro
        lrelease xulpymoney.pro
}

src_install(){
	dodir /etc/xulpymoney-qt
	dodir /usr/lib/xulpymoney-qt
	dodir /usr/share/xulpymoney-qt/sql

	insinto /etc/xulpymoney-qt
	newins config.py config.py.dist

        newbin xulpymoney.py xulpymoney-qt

	dodoc GPL-3.txt CHANGELOG-* AUTHORS-* RELEASES-* xulpymoney-*.odt 

	insinto /usr/lib/xulpymoney-qt
	doins i18n/*.qm
	doins images/*.py
	doins ui/*.py

	insinto /usr/share/xulpymoney-qt/sql
	doins sql/pgsql.*

        cp images/dinero.png xulpymoney-qt.png
        doicon xulpymoney-qt.png
        make_desktop_entry xulpymoney-qt "Xulpymoney-qt" /usr/share/pixmaps/xulpymoney-qt.png


}
