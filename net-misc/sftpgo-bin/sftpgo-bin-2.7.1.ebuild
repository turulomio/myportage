# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 shell-completion

DESCRIPTION="SFTP, FTP/S, WebDAV and HTTP/S file transfer server"
HOMEPAGE="https://github.com/drakkan/sftpgo"
SRC_URI="https://github.com/drakkan/sftpgo/releases/download/v${PV}/sftpgo_v${PV}_linux_x86_64.tar.xz -> ${P}.tar.xz"

S="${WORKDIR}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="bash-completion zsh-completion"

RESTRICT="mirror strip"
QA_PREBUILT="usr/bin/sftpgo"

RDEPEND="
	acct-group/sftpgo
	acct-user/sftpgo
"

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]] ; then
		use amd64 || die "Este ebuild solo soporta la arquitectura amd64."
	fi
}

src_prepare() {
	default
	gunzip man/man1/*.1.gz || die
}

src_install() {
	dobin sftpgo
	doman man/man1/*.1

	insinto /etc/sftpgo
	doins sftpgo.json
	fowners root:sftpgo /etc/sftpgo/sftpgo.json
	fperms 0640 /etc/sftpgo/sftpgo.json

	newinitd "${FILESDIR}/sftpgo.initd" sftpgo
	newconfd "${FILESDIR}/sftpgo.confd" sftpgo

	insinto /usr/share/${PN}
	doins -r templates static openapi

	keepdir /var/lib/sftpgo
	fowners sftpgo:sftpgo /var/lib/sftpgo
	fperms 0750 /var/lib/sftpgo

	keepdir /var/log/sftpgo
	fowners sftpgo:sftpgo /var/log/sftpgo
	fperms 0750 /var/log/sftpgo

	if use bash-completion ; then
		newbashcomp bash_completion/sftpgo sftpgo
	fi

	if use zsh-completion ; then
		newzshcomp zsh_completion/_sftpgo _sftpgo
	fi

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
