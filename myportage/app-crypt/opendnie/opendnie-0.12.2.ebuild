# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Driver OpenDNIe para el DNI electrónico"
HOMEPAGE="http://opendnie.cenatic.es"
SRC_URI="http://forja.cenatic.es/frs/download.php/1332/opensc-opendnie-0.12.2.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="udev usb"

DEPEND="
        sys-apps/pcsc-lite
        app-crypt/ccid
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/opensc-0.12.2"

src_configure() {
   econf
}

src_compile() {
   emake || die
}

src_install() {
   emake DESTDIR="${D}" install || die "make failed"
}

pkg_postinst() {
                ewarn "Recuerda inciar el servicio:"
                ewarn ""
                ewarn "#/etc/init.d/pcscd start"
                ewarn ""
                ewarn "y añadirlo de modo permanente:"
                ewarn ""
                ewarn "#rc-update add pcscd default"
                ewarn ""
                ewarn "No olvides añadir tu usuario al grupo pcscd y reiniciar sesión:"
                ewarn ""
                ewarn "#gpasswd -a vuestro_usuario pcscd"
                ewarn ""
                ewarn "Para mas información, preguntas o problemas consulta esta url:"
                ewarn "http://forums.gentoo.org/viewtopic-t-923326.html"
ewarn ""
ewarn ""
} 
