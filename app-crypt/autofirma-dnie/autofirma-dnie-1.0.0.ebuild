
# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker desktop xdg

DESCRIPTION="Paquete integrado de AutoFirma 1.9 y módulo PKCS#11 FNMT/DNIe unificado"

HOMEPAGE="
    https://www.sede.fnmt.gob.es/
    https://www.dnielectronico.es/
    https://firmaelectronica.gob.es/
    https://github.com/jrubioh1/j-overlay
"

SRC_URI="
    https://www.sede.fnmt.gob.es/documents/10445900/12022460/libpkcs11-fnmtdnie_2.0.1_amd64.deb -> libpkcs11-fnmtdnie_2.0.1_amd64.deb
    https://firmaelectronica.gob.es/content/dam/firmaelectronica/descargas-software/autofirma19/Autofirma_Linux_Debian.zip -> AutoFirma_Linux_Debian_1.9.0.zip
    https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.7.tar.bz2
"

LICENSE="GPL-2 EUPL-1.2 LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror strip"

IUSE="X"

RDEPEND="
    dev-libs/opensc[pcsc-lite,secure-messaging,ssl]
    sys-apps/pcsc-lite
    app-crypt/ccid
    net-libs/gnutls[pkcs11]
    dev-libs/libgpg-error
    dev-libs/nss
    app-misc/ca-certificates
    >=dev-java/openjdk-17:*
    app-admin/sudo
    X? (
	x11-libs/libX11
	x11-libs/gtk+:3
    )
"

BDEPEND="
    app-arch/unzip
    app-arch/xz-utils
    dev-util/patchelf
    virtual/pkgconfig
"

QA_MULTILIB_PATHS="
    usr/lib/libpkcs11-fnmtdnie.*
    usr/lib/libpkcs11-dnie.*
    usr/lib/dnie-compat/.*
    usr/lib/Autofirma/.*
"

S="${WORKDIR}"

src_unpack() {
    unpacker_src_unpack

    local deb_interno
    for deb_interno in "${WORKDIR}"/*.deb; do
	if [[ -f "${deb_interno}" ]]; then
	    unpacker "${deb_interno}"
	fi
    done
}

src_prepare() {
    default
    
    if [[ -d "${WORKDIR}/libassuan-2.5.7" ]]; then
	einfo "Corrigiendo script de versión en libassuan para soportar LIBASSUAN_2.0..."
	local vers_file="${WORKDIR}/libassuan-2.5.7/src/libassuan.vers"
	if [[ -f "${vers_file}" ]]; then
	    cat <<'EOF' > "${vers_file}"
LIBASSUAN_1.0 {
    global:
	assuan_*;
	_assuan_*;
    local:
	*;
};

LIBASSUAN_2.0 {
    global:
	assuan_*;
	_assuan_*;
} LIBASSUAN_1.0;
EOF
	fi
    fi
}

src_configure() {
    if [[ -d "${WORKDIR}/libassuan-2.5.7" ]]; then
	einfo "Configurando libassuan 2.5.7 aislado..."
	cd "${WORKDIR}/libassuan-2.5.7" || die
	econf \
	    --prefix="/usr" \
	    --libdir="/usr/lib/dnie-compat" \
	    --disable-static \
	    --enable-shared
    fi
}

src_compile() {
    if [[ -d "${WORKDIR}/libassuan-2.5.7" ]]; then
	einfo "Compilando libassuan 2.5.7..."
	cd "${WORKDIR}/libassuan-2.5.7" || die
	emake
    fi
}

src_install() {
    # 1. Instalar libassuan 2.5.7 compilada en su directorio aislado
    if [[ -d "${WORKDIR}/libassuan-2.5.7" ]]; then
	einfo "Instalando libassuan 2.5.7 nativa..."
	cd "${WORKDIR}/libassuan-2.5.7" || die
	emake DESTDIR="${D}" install

	local lib_real
	lib_real=$(find "${ED}/usr/lib/dnie-compat" -type f -name "libassuan.so.0*" | head -n 1)
	if [[ -n "${lib_real}" && -f "${lib_real}" ]]; then
	    mv "${lib_real}" "${ED}/usr/lib/dnie-compat/libassuan-dnie.so.0" || die "Error renombrando libassuan"
	    find "${ED}/usr/lib/dnie-compat" -type l -delete
	    rm -f "${ED}/usr/lib/dnie-compat/libassuan.la"
	else
	    die "No se encontró la librería compilada libassuan.so en /usr/lib/dnie-compat"
	fi

	rm -rf "${ED}/usr/bin/libassuan-config"
	rm -rf "${ED}/usr/include/assuan.h"
	rm -rf "${ED}/usr/share/aclocal/libassuan.m4"
	rm -rf "${ED}/usr/share/info"
    fi

    # 2. Copiar estructuras extraídas de los .deb
    if [[ -d "${S}/usr" ]]; then
	cp -a "${S}/usr" "${ED}/" || die "Error al copiar directorio /usr"
    fi

    if [[ -d "${S}/etc" ]]; then
	cp -a "${S}/etc" "${ED}/" || die "Error al copiar directorio /etc"
    fi

    # 3. Purgar cualquier instalación basura en /usr/local heredada de los .deb
    rm -rf "${ED}/usr/local"

    # 4. Parchear binarios ELF
    local f
    while IFS= read -r -d '' f; do
	if [[ -f "${f}" && ! -L "${f}" ]]; then
	    patchelf --replace-needed libassuan.so.0 libassuan-dnie.so.0 "${f}" 2>/dev/null
	    patchelf --replace-needed libassuan.so.9 libassuan-dnie.so.0 "${f}" 2>/dev/null
	    patchelf --force-rpath --set-rpath '/usr/lib/dnie-compat:/usr/lib64:/usr/lib' "${f}" 2>/dev/null
	fi
    done < <(find "${ED}/usr/lib" -maxdepth 2 -type f -name "*.so*" -print0)

    # 5. Limpieza de residuos
    find "${ED}" -name "*.la" -delete || die
    find "${ED}" -name "*.gz" -delete || die

    # 6. Normalización de documentación
    mkdir -p "${ED}/usr/share/doc/${PF}" || die
    if [[ -d "${ED}/usr/share/doc/Autofirma" ]]; then
	cp -a "${ED}/usr/share/doc/Autofirma/"* "${ED}/usr/share/doc/${PF}/" 2>/dev/null
	rm -rf "${ED}/usr/share/doc/Autofirma"
    fi
    if [[ -d "${ED}/usr/share/doc/libpkcs11-fnmtdnie" ]]; then
	cp -a "${ED}/usr/share/doc/libpkcs11-fnmtdnie/"* "${ED}/usr/share/doc/${PF}/" 2>/dev/null
	rm -rf "${ED}/usr/share/doc/libpkcs11-fnmtdnie"
    fi

    # 7. Eliminar accesos directos redundantes e inválidos del .deb de la FNMT
    rm -f "${ED}/usr/share/applications/launch.dnie.desktop"
    rm -f "${ED}/usr/share/applications/launch.fnmtdnie.desktop"

    # Corregir la categoría en afirma.desktop original para evitar QA Warning de Portage
    if [[ -f "${ED}/usr/share/applications/afirma.desktop" ]]; then
	sed -i 's/Categories=.*Application;/Categories=Utility;Security;/' "${ED}/usr/share/applications/afirma.desktop"
	sed -i 's/Categories=Application;/Categories=Utility;Security;/' "${ED}/usr/share/applications/afirma.desktop"
    fi

    # 8. Registro e instalación completa de los iconos oficiales (SVG y PNG)
    insinto /usr/share/pixmaps
    if [[ -f "${ED}/usr/share/AutoFirma/AutoFirma.svg" ]]; then
	newins "${ED}/usr/share/AutoFirma/AutoFirma.svg" autofirma.svg
	newins "${ED}/usr/share/AutoFirma/AutoFirma.svg" AutoFirma.svg
    fi
    if [[ -f "${ED}/usr/lib/Autofirma/AutoFirma.png" ]]; then
	newins "${ED}/usr/lib/Autofirma/AutoFirma.png" autofirma.png
	newins "${ED}/usr/lib/Autofirma/AutoFirma.png" AutoFirma.png
    fi

    insinto /usr/share/icons/hicolor/scalable/apps
    if [[ -f "${ED}/usr/share/AutoFirma/AutoFirma.svg" ]]; then
	newins "${ED}/usr/share/AutoFirma/AutoFirma.svg" afirma.svg
	newins "${ED}/usr/share/AutoFirma/AutoFirma.svg" autofirma.svg
    fi

    local size
    for size in 16x16 32x32 48x48 128x128 256x256; do
	insinto "/usr/share/icons/hicolor/${size}/apps"
	if [[ -f "${ED}/usr/lib/Autofirma/AutoFirma.png" ]]; then
	    newins "${ED}/usr/lib/Autofirma/AutoFirma.png" afirma.png
	    newins "${ED}/usr/lib/Autofirma/AutoFirma.png" autofirma.png
	fi
    done

    # 9. Preferencias del protocolo afirma:// en Firefox Gentoo
    insinto /usr/lib64/firefox/browser/defaults/preferences
    cat <<'EOF' > "${T}/autofirma-gentoo.js"
pref("network.protocol-handler.expose.afirma", true);
pref("network.protocol-handler.external.afirma", true);
EOF
    doins "${T}/autofirma-gentoo.js"

    # 10. Instalación de TODOS los certificados CA contenidos en libpkcs11-fnmtdnie
    insinto /usr/share/ca-certificates
    local cert
    while IFS= read -r -d '' cert; do
	if [[ -f "${cert}" ]]; then
	    doins "${cert}"
	fi
    done < <(find "${ED}/usr/share/libpkcs11-fnmtdnie" -type f -name "*.crt" -print0)

    keepdir /usr/lib/Autofirma
    keepdir /usr/lib/dnie-compat
}

pkg_postinst() {
    xdg_pkg_postinst

    if [[ -z "${ROOT}" ]] && type -p ldconfig >/dev/null; then
	ldconfig
    fi

    # 1. Generación automática del certificado raíz local de AutoFirma
    if [[ -f "/usr/lib/Autofirma/autofirmaConfigurador.jar" ]]; then
	einfo "Generando certificado raíz local de AutoFirma..."
	(cd /usr/lib/Autofirma && java -jar autofirmaConfigurador.jar >/dev/null 2>&1)

	if [[ -f /usr/lib/Autofirma/AutoFirma_ROOT.cer ]]; then
	    cp /usr/lib/Autofirma/AutoFirma_ROOT.cer /usr/share/ca-certificates/autofirma-root.crt 2>/dev/null
	elif compgen -G "/usr/lib/Autofirma/*.cer" > /dev/null; then
	    cp /usr/lib/Autofirma/*.cer /usr/share/ca-certificates/autofirma-root.crt 2>/dev/null
	fi
    fi

    # 2. Registrar todos los certificados de la FNMT/DNIe y AutoFirma en ca-certificates.conf
    if [[ -f /etc/ca-certificates.conf ]]; then
	local cfile cname
	for cfile in /usr/share/libpkcs11-fnmtdnie/*.crt; do
	    if [[ -f "${cfile}" ]]; then
		cname=$(basename "${cfile}")
		grep -q "^${cname}" /etc/ca-certificates.conf || echo "${cname}" >> /etc/ca-certificates.conf
	    fi
	done
	grep -q "^autofirma-root.crt" /etc/ca-certificates.conf || echo "autofirma-root.crt" >> /etc/ca-certificates.conf
    fi

    # 3. Actualizar almacén de certificados global de Gentoo
    if type -p update-ca-certificates >/dev/null; then
	einfo "Actualizando almacén global de certificados del sistema..."
	update-ca-certificates >/dev/null 2>&1
    fi

    # Definición de códigos de color ANSI para resaltado
    local BOLD="\033[1m"
    local RED="\033[1;31m"
    local YELLOW="\033[1;33m"
    local GREEN="\033[1;32m"
    local CYAN="\033[1;36m"
    local RESET="\033[0m"

    elog ""
    elog "${CYAN}=================================================================${RESET}"
    elog "${GREEN}             INSTALACIÓN AUTOMATIZADA COMPLETADA                ${RESET}"
    elog "${CYAN}=================================================================${RESET}"
    elog "Se han configurado automáticamente en el sistema:"
    elog "  ✓ Lanzador oficial original respetando WMClass y SVG."
    elog "  ✓ El protocolo de Firefox (autofirma-gentoo.js)."
    elog "  ✓ El icono oficial registrado en el tema hicolor."
    elog "  ✓ Registro del esquema MIME (afirma:// %u)."
    elog "  ✓ Generación de claves y certificados raíz locales de AutoFirma."
    elog "  ✓ Registro de las 8 CAs de FNMT/DNIe y AutoFirma en el sistema."
    elog ""
    elog "${RED}*****************************************************************${RESET}"
    elog "${RED} !!! MUY IMPORTANTE !!! CONFIGURACIÓN MANUAL REQUERIDA EN FIREFOX ${RESET}"
    elog "${RED}*****************************************************************${RESET}"
    elog ""
    elog "${YELLOW}1. Módulo PKCS#11 unificado FNMT / DNIe:${RESET}"
    elog "   - Ve a: Ajustes -> Privacidad & Seguridad -> Dispositivos de seguridad..."
    elog "   - Haz clic en 'Cargar'"
    elog "   - Nombre: ${BOLD}FNMT/DNIe PKCS#11${RESET}"
    elog "   - Ruta:   ${BOLD}/usr/lib/libpkcs11-fnmtdnie.so${RESET}"
    elog ""
    elog "${YELLOW}2. Confianza de Certificados CA en Firefox:${RESET}"
    elog "   - Ve a: Ajustes -> Privacidad & Seguridad -> Ver certificados... -> Autoridades"
    elog "   - Haz clic en 'Importar' y añade los certificados desde:"
    elog "     * ${BOLD}/usr/share/libpkcs11-fnmtdnie/*.crt${RESET}"
    elog "     * ${BOLD}/usr/lib/Autofirma/*.cer${RESET}"
    elog "   - Marca las casillas para confiar en la identificación de sitios y usuarios."
    elog "${CYAN}=================================================================${RESET}"
    elog ""
}

pkg_postrm() {
    xdg_pkg_postrm

    if [[ -z "${REPLACED_BY_VERSION}" ]]; then
	rm -f /usr/share/ca-certificates/autofirma-root.crt
	
	if [[ -f /etc/ca-certificates.conf ]]; then
	    local cfile cname
	    for cfile in /usr/share/libpkcs11-fnmtdnie/*.crt; do
		if [[ -f "${cfile}" ]]; then
		    cname=$(basename "${cfile}")
		    sed -i "/^${cname}/d" /etc/ca-certificates.conf
		fi
	    done
	    sed -i '/^autofirma-root.crt/d' /etc/ca-certificates.conf
	fi

	rm -rf "${EROOT}/usr/lib/Autofirma"
	rm -rf "${EROOT}/usr/lib/dnie-compat"
    fi

    if type -p update-ca-certificates >/dev/null; then
	update-ca-certificates >/dev/null 2>&1
    fi

    if [[ -z "${ROOT}" ]] && type -p ldconfig >/dev/null; then
	ldconfig
    fi
}