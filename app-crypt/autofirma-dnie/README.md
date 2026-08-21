# Documentación del Ebuild `app-crypt/autofirma-dnie`

**Autor:** Jorge Rubio (`jrubioh1`)  
**Overlay:** `j-overlay` (`https://github.com/jrubioh1/j-overlay`)  
**Paquete:** `app-crypt/autofirma-dnie-1.0.0`  
**Versión de EAPI:** 8  

---

## 📌 Visión General

El ebuild `autofirma-dnie` proporciona un empaquetado integral para Gentoo Linux que unifica **AutoFirma 1.9.0** y el **módulo PKCS#11 de la FNMT / DNIe (v2.0.1)**. 

Debido a que los binarios oficiales distribuidos por la FNMT y el Gobierno de España están compilados para distribuciones basadas en Debian/Ubuntu y enlazan contra versiones específicas o modificadas de librerías como `libassuan`, este ebuild automatiza la resolución de dependencias ABI, la compilación aislada de compatibilidad, el parcheo binario ELF, la instalación de certificados de autoridad (CA) y la integración desktop/navegador en Gentoo.

---


## 🏗️ Estructura del Ebuild

### 1. Cabecera y Eclasses Heredadas (`inherit`)

```bash
EAPI=8
inherit unpacker desktop xdg
```

* **`unpacker`**: Permite la extracción automática de formatos comprimidos complejos, incluyendo la extracción anidada de paquetes `.deb` y `.zip`.
* **`desktop`**: Proporciona utilidades para la manipulación e instalación de archivos `.desktop` e iconos.
* **`xdg`**: Actualiza automáticamente la base de datos MIME, caches de iconos de escritorio y menús del sistema tras la instalación o desinstalación.

---

### 2. Fuentes de Descarga (`SRC_URI`)

El ebuild obtiene 3 artefactos fuente principales:
1. **`libpkcs11-fnmtdnie_2.0.1_amd64.deb`**: Módulo PKCS#11 oficial de la FNMT/DNIe.
2. **`AutoFirma_Linux_Debian_1.9.0.zip`**: Paquete oficial de AutoFirma 1.9 para Linux.
3. **`libassuan-2.5.7.tar.bz2`**: Código fuente de `libassuan 2.5.7` para compilar una versión aislada de compatibilidad ABI.

---

### 3. Restricciones y Variables QA

* **`RESTRICT="mirror strip"`**:
  * `mirror`: Evita que Gentoo intente buscar los paquetes en los mirrors oficiales de Gentoo.
  * `strip`: Previene que Portage aplique `strip` a los binarios/librerías precompilados de los `.deb` (evitando corromper binarios o símbolos del módulo PKCS#11).
* **`QA_MULTILIB_PATHS`**: Suprime advertencias falsas positivas del verificador QA de Portage relacionadas con librerías de 64 bits instaladas bajo `/usr/lib/` (`/usr/lib/libpkcs11-*`, `/usr/lib/Autofirma/`, `/usr/lib/dnie-compat/`).

---

### 4. Dependencias (`RDEPEND` y `BDEPEND`)

#### Dependencias de Ejecución (`RDEPEND`):
* `dev-libs/opensc[pcsc-lite,secure-messaging,ssl]`: Soporte de tarjetas inteligentes (Smart Cards / DNIe).
* `sys-apps/pcsc-lite` y `app-crypt/ccid`: Daemon y controladores para lectores de tarjetas inteligentes.
* `net-libs/gnutls[pkcs11]`, `dev-libs/libgpg-error`, `dev-libs/nss`: Criptografía y gestión de certificados de seguridad.
* `app-misc/ca-certificates`: Almacén de certificados raíz del sistema.
* `>=dev-java/openjdk-17:*`: Entorno de ejecución Java para AutoFirma (`.jar`).
* `app-admin/sudo`: Requerido por los scripts internos de configuración.
* `X? ( x11-libs/libX11 x11-libs/gtk+:3 )`: Librerías de interfaz gráfica (si la USE flag `X` está activa).

#### Dependencias de Compilación (`BDEPEND`):
* `app-arch/unzip`, `app-arch/xz-utils`: Extracción de archivos comprimidos.
* `dev-util/patchelf`: Herramienta fundamental para modificar cabeceras ELF, `NEED` y `RPATH` en librerías precompiladas.
* `virtual/pkgconfig`: Herramienta de compilación.

---

## ⚙️ Fases del Ebuild Explicadas Detalladamente

```
  src_unpack ──► src_prepare ──► src_configure ──► src_compile ──► src_install ──► pkg_postinst
```

### 🔹 `src_unpack()`
1. Invoca `unpacker_src_unpack` para desempaquetar el archivo ZIP de AutoFirma y el tarball de `libassuan`.
2. Escanea la carpeta del espacio de trabajo (`WORKDIR`) en busca de archivos `.deb` extraídos y los desempaqueta automáticamente (extrayendo los sistemas de archivos internos `data.tar.xz`).

---

### 🔹 `src_prepare()`
* Corrige el script de versión de símbolos en el código fuente de `libassuan-2.5.7` (`src/libassuan.vers`).
* Añade la sección de versión de símbolo `LIBASSUAN_2.0` heredando de `LIBASSUAN_1.0`. Esto permite que librerías de la FNMT que buscan explícitamente la versión de símbolo `LIBASSUAN_2.0` puedan enlazar correctamente sin provocar errores de linker dinámico (`undefined symbol`).

---

### 🔹 `src_configure()`
* Configura la compilación de `libassuan-2.5.7` en modo aislado:
  * `--prefix="/usr"`
  * `--libdir="/usr/lib/dnie-compat"` (Aísla las librerías para no sobreescribir la `libassuan` del sistema Gentoo).
  * `--enable-shared --disable-static`

---

### 🔹 `src_compile()`
* Compila la versión aislada de `libassuan-2.5.7` utilizando `emake`.

---

### 🔹 `src_install()`

Esta fase ejecuta 10 pasos fundamentales de empaquetado e integración:

1. **Instalación y Aislamiento de `libassuan`:**
   * Instala `libassuan` en `${ED}/usr/lib/dnie-compat`.
   * Renombra la librería resultante a `libassuan-dnie.so.0` para evitar conflictos globales con la versión nativa del sistema.
   * Elimina cabeceras, archivos `.la`, binarios de configuración y páginas de info para no ensuciar `/usr/include` ni `/usr/bin`.

2. **Copia de Estructuras Extraídas:**
   * Copia los árboles `/usr` y `/etc` extraídos de los paquetes `.deb` al directorio de instalación intermedia de Portage (`${ED}`).

3. **Limpieza de Rastro Basura:**
   * Elimina cualquier directorio `/usr/local` heredado de la estructura Debian de los `.deb`.

4. **Parcheo de Binarios ELF con `patchelf`:**
   * Recorre todas las librerías dinámicas (`.so`) en `/usr/lib`.
   * Reemplaza las dependencias de librerías requeridas (`libassuan.so.0` y `libassuan.so.9`) por `libassuan-dnie.so.0`.
   * Inyecta el `RPATH` forzado `'/usr/lib/dnie-compat:/usr/lib64:/usr/lib'` en los binarios para garantizar que encuentren la librería de compatibilidad al ejecutarse.

5. **Limpieza de Archivos Residuales:**
   * Elimina archivos `.la` y `.gz` innecesarios.

6. **Normalización de Documentación:**
   * Consolida la documentación proveniente de `Autofirma` y `libpkcs11-fnmtdnie` en la ruta estándar de Gentoo: `/usr/share/doc/${PF}/`.

7. **Ajuste de Lanzadores y Cumplimiento QA:**
   * Elimina accesos directos obsoletos/inválidos de la FNMT (`launch.dnie.desktop`, `launch.fnmtdnie.desktop`).
   * Parchea la categoría del archivo `afirma.desktop` a `Categories=Utility;Security;` para cumplir estrictamente las reglas QA de Gentoo.

8. **Instalación y Registro de Iconos:**
   * Registra los iconos oficiales SVG y PNG en `/usr/share/pixmaps` y en el tema `hicolor` en múltiples resoluciones (`16x16`, `32x32`, `48x48`, `128x128`, `256x256`).

9. **Configuración del Protocolo `afirma://` en Firefox:**
   * Genera e instala `/usr/lib64/firefox/browser/defaults/preferences/autofirma-gentoo.js` habilitando el manejador externo de protocolos para la URI `afirma://`.

10. **Instalación de Certificados CA:**
    * Copia todos los certificados de Autoridad de Certificación (`.crt`) contenidos en la FNMT a `/usr/share/ca-certificates/`.
    * Utiliza `keepdir` para asegurar la permanencia de las rutas de runtime `/usr/lib/Autofirma` y `/usr/lib/dnie-compat`.

---

### 🔹 `pkg_postinst()` (Post-Instalación en el Sistema Destino)

1. **Generación del Certificado Raíz Local de AutoFirma:**
   * Ejecuta `java -jar /usr/lib/Autofirma/autofirmaConfigurador.jar` para generar las claves SSL locales y el certificado raíz `AutoFirma_ROOT.cer`.
   * Copia dicho certificado a `/usr/share/ca-certificates/autofirma-root.crt`.

2. **Registro en `/etc/ca-certificates.conf`:**
   * Añade automáticamente todos los certificados `.crt` de la FNMT/DNIe y el `autofirma-root.crt` al archivo de configuración de certificados del sistema.

3. **Actualización del Almacén Global de Certificados:**
   * Ejecuta `update-ca-certificates` para regenerar la cadena de confianza en Gentoo (`/etc/ssl/certs`).

4. **Instrucciones en Consola (`elog`):**
   * Imprime un resumen formateado en colores notificando la instalación exitosa y detallando los pasos de configuración manual requeridos en el navegador Firefox (Cargar módulo PKCS#11 `/usr/lib/libpkcs11-fnmtdnie.so` e importar certificados CA).

---

### 🔹 `pkg_postrm()` (Post-Desinstalación)

* Cuando el paquete se elimina completamente (y no durante una actualización de versión):
  * Elimina los certificados registrados en `/etc/ca-certificates.conf` y `/usr/share/ca-certificates/`.
  * Elimina los directorios residuales `/usr/lib/Autofirma` y `/usr/lib/dnie-compat`.
  * Ejecuta `update-ca-certificates` y `ldconfig` para restablecer el estado limpio del sistema.

---

## 🛠️ Resumen de Archivos Auxiliares (`files/`)

* **`files/99autofirma-dnie`**: Define `CONFIG_PROTECT="/lib/Autofirma"` para prevenir que actualizaciones del sistema sobrescriban la configuración o claves locales de AutoFirma.
* **`files/autofirma.js`**: Ajuste secundario de preferencias JavaScript para Firefox.
