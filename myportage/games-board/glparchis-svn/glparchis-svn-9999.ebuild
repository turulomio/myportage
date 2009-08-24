inherit subversion autotools eutils

DESCRIPTION="OpenGL Parchis"
HOMEPAGE="http://glparchis.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
DOCS="ChangeLog* README* AUTHORS"

ESVN_REPO_URI="https://glparchis.svn.sourceforge.net/svnroot/glparchis"

DEPEND="
media-libs/ftgl
"
RDEPEND=${DEPEND}

src_unpack() {
        subversion_src_unpack
#        cd ${S}/navit/navit/
#        sed -i -e "s:orientation=\"-1\":orientation=\"1\":" navit.xml
#        sed -i -e "s:echo 'Fix the speech tag in navit.xml to let navit say\:' '\%s':espeak -ves+1 -w /tmp/navit.wav '\%s'; playsound /tmp/navit.wav:" navit.xml

#	cd ${S}/navit
        ./autogen.sh || die "autogen.sh failed"
}



src_install () {
	cd po
	make update-po
	cd ..
        emake DESTDIR="${D}" install || die "install failed"
}
