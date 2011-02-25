inherit subversion autotools eutils

DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://glparchis.svn.sourceforge.net/svnroot/glparchis/pyglParchis"

DEPEND="
dev-python/pyopengl
"
RDEPEND=${DEPEND}


src_compile(){
        pyrcc4 images/glparchis.qrc > images/glparchis_rc.py
        pylupdate4 -noobsolete pyglparchis.pro
        lrelease pyglparchis.pro
        pyuic4 ui/frmAbout.ui > ui/Ui_frmAbout.py 
        pyuic4 ui/frmMain.ui > ui/Ui_frmMain.py
        pyuic4 ui/wdgUserPanel.ui > ui/Ui_wdgUserPanel.py


}

src_install(){
        dodir /usr/lib/glparchis
        dodir /usr/share/glparchis

        newbin glparchis.py glparchis

        dodoc GPL-3.txt CHANGELOG-* AUTHORS-* RELEASES-* doc/glparchis-* 

        insinto /usr/lib/glparchis
        doins i18n/*.qm
        doins images/*.py
        doins ui/*.py

        cp images/ficharoja.png glparchis.png
        doicon glparchis.png
        make_desktop_entry glparchis "glParchis" /usr/share/pixmaps/glparchis.png
}
