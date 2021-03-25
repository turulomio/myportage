EAPI=7

inherit desktop java-utils-2 rpm xdg

DESCRIPTION="Spanish government's electronic signature application for online procedures"
HOMEPAGE="https://administracionelectronica.gob.es/ctt/clienteafirma"
SRC_URI="https://estaticos.redsara.es/comunes/autofirma/1/6/5/AutoFirma_Linux.zip -> ${P}.zip"

LICENSE="|| ( GPL-2+ EUPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/jre:1.8"
BDEPEND="app-arch/unzip"

S=${WORKDIR}

src_prepare() {
        sed -i 's:autoFirma:autofirma:' usr/lib64/firefox/defaults/pref/autofirma.js || die "sed failed"
        eapply_user
}

src_unpack() {
	default
	rpm_unpack "./${P}-1.noarch.rpm"
}



src_install() {
	java-pkg_dojar "usr/lib64/${PN}/${PN}.jar"
	java-pkg_dolauncher
	java-pkg_dojar "usr/lib64/${PN}/${PN}Configurador.jar"
	doicon "usr/lib64/${PN}/${PN}.png"
	insinto /usr/lib64/firefox/defaults/pref/
	doins usr/lib64/firefox/defaults/pref/autofirma.js
	make_desktop_entry "${PN} %u" AutoFirma "${PN}" "Utility" "Comment[es]=Aplicación de firma electrónica de la FNMT\nMimeType=x-scheme-handler/afirma"
	dodoc AF_manual_instalacion_usuarios_ES.pdf
}
