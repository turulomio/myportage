EAPI="2"
inherit subversion autotools eutils games

DESCRIPTION="MTP-Target"
SRC_URI=""

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

ESVN_REPO_URI="svn://mtp-target.org/trunk"

src_unpack() {
        subversion_src_unpack
	cd ${S}
	epatch ${FILESDIR}/Variables.mk.patch
	make update
}


src_compile() {
        cd ${S}
        emake all || die "make failed"
}

src_install () {
        cd ${S}
        emake DESTDIR="${D}" install || die "install failed"
        dodoc ChangeLog* README*  AUTHORS
}

