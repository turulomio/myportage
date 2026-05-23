# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Full-featured and highly configurable SFTP, FTP/S, WebDAV and HTTP/S file transfer server"
HOMEPAGE="https://github.com/drakkan/sftpgo"

# Ajusta SRC_URI a la URL real del tarball binario en GitHub Releases
SRC_URI="https://github.com/drakkan/sftpgo/releases/download/v${PV}/sftpgo_v${PV}_linux_x86_64.tar.xz -> ${P}.tar.xz"

S="${WORKDIR}"

LICENSE="AGPL-3.0-only"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="bash-completion zsh-completion"

# El binario es precompilado; no necesita toolchain
RESTRICT="mirror strip"
QA_PREBUILT="usr/bin/sftpgo"

RDEPEND="
	acct-group/sftpgo
	acct-user/sftpgo
"

# sftpgo no necesita BUILD_DEPEND ni DEPEND al ser un binario precompilado

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]] ; then
		use amd64 || die "Este ebuild solo soporta la arquitectura amd64."
	fi
}

src_install() {
	# --- Binario principal ---
	dobin sftpgo

	# --- Páginas man ---
	doman man/man1/*.1.gz

	# --- Configuración por defecto ---
	insinto /etc/sftpgo
	doins sftpgo.json
	# Proteger el fichero de configuración con permisos restrictivos
	fowners root:sftpgo /etc/sftpgo/sftpgo.json
	fperms 0640 /etc/sftpgo/sftpgo.json

	# --- Script de init OpenRC ---
	# El tarball sólo incluye sftpgo.service (systemd).
	# Se proporciona aquí un script OpenRC propio; ajústalo a tus necesidades.
	newinitd "${FILESDIR}/sftpgo.initd" sftpgo
	newconfd "${FILESDIR}/sftpgo.confd" sftpgo

	# --- Datos de la aplicación (plantillas, estáticos, openapi) ---
	insinto /usr/share/${PN}
	doins -r templates static openapi

	# --- Base de datos SQLite de ejemplo (solo como referencia; no usar en producción) ---
	# doins sqlite/sftpgo.db   # Omitida intencionalmente: no instalar BD de ejemplo

	# --- Directorio de trabajo con permisos correctos ---
	keepdir /var/lib/sftpgo
	fowners sftpgo:sftpgo /var/lib/sftpgo
	fperms 0750 /var/lib/sftpgo

	# --- Directorio de logs ---
	keepdir /var/log/sftpgo
	fowners sftpgo:sftpgo /var/log/sftpgo
	fperms 0750 /var/log/sftpgo

	# --- Completado de shell ---
	if use bash-completion ; then
		newbashcomp bash_completion/sftpgo sftpgo
	fi

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		newins zsh_completion/_sftpgo _sftpgo
	fi

	# --- Licencia ---
	dodoc LICENSE NOTICE README.txt
}

pkg_postinst() {
	elog "SFTPGo ha sido instalado como binario precompilado."
	elog ""
	elog "Ficheros de configuración en: /etc/sftpgo/sftpgo.json"
	elog "Directorio de datos en:       /var/lib/sftpgo"
	elog "Logs en:                       /var/log/sftpgo"
	elog ""
	elog "Para iniciar el servicio:"
	elog "  rc-update add sftpgo default"
	elog "  rc-service sftpgo start"
	elog ""
	ewarn "Revisa /etc/conf.d/sftpgo antes de arrancar el servicio."
	ewarn "El fichero de configuración sftpgo.json contiene valores por defecto"
	ewarn "y puede necesitar ajustes para tu entorno."
}
