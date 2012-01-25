# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="Controlador opensc para el DNI electrónico"
HOMEPAGE="www.dnie.es"

ESVN_REPO_URI="https://svn.forge.morfeo-project.org/opendnie/opensc-dnie/trunk"
ESVN_PROJECT="${PN/-svn}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/binutils"

RDEPEND="dev-lang/perl
dev-libs/opensc"

src_install() {
        emake DESTDIR="${D}" install || die "emake install failed"
}

src_compile() {
        "$WORKDIR/"${PN}-${PV}"/bootstrap"
        econf \
                --prefix=/usr \
                --sysconfdir=/etc \
                --datadir=/usr/share \
                --infodir=/usr/share/info \
                --mandir=/usr/share/man \
                || die "configure failed"
   emake || die "emake failed"
}

pkg_postinst() {
    ewarn
    ewarn "Paquete de pruebas"
    ewarn
} 
