# Repository Guidelines for AI Assistants (AGENTS.md)

This file contains persistent guidelines, rules, and development standards for AI coding assistants working in the `myportage` Gentoo overlay repository.

---

## 1. Herramientas Recomendadas para Desarrollo y QA

Para trabajar y validar ebuilds en este overlay sin requerir permisos de root, se recomienda que el administrador del sistema instale los siguientes paquetes:

```bash
emerge --ask dev-util/pkgcheck dev-util/pkgdev app-portage/gentoolkit
```

* **`dev-util/pkgcheck`**: Herramienta estándar de control de calidad (QA). Realiza análisis estático exhaustivo de ebuilds, dependencias, sintaxis y buenas prácticas sin requerir privilegios de superusuario (`pkgcheck scan`).
* **`dev-util/pkgdev`**: Conjunto de herramientas oficiales para desarrolladores de Gentoo (gestión de manifests, commits estructurados).
* **`app-portage/gentoolkit`**: Proporciona comandos como `equery` para inspeccionar paquetes, dependencias y archivos instalados sin privilegios root.
* *(Opcional)* Añadir el usuario local al grupo `portage` (`gpasswd -a <usuario> portage`) para facilitar lecturas directas de cachés del sistema.

---

## 2. Procedimiento para Comprobar y Probar Ebuilds sin Root

Dado que el entorno de desarrollo opera sin privilegios `root`, no se debe ejecutar `emerge` para instalar paquetes en el sistema (`/`). En su lugar, se debe utilizar el comando `ebuild` aislando las rutas de compilación y descarga al espacio de usuario:

### 2.1. Configuración de Entorno de Usuario
Para evitar errores de permisos en `/var/tmp/portage` o `/var/cache/distfiles`, definir rutas temporales en el directorio personal del usuario:

```bash
export PORTAGE_TMPDIR="${HOME}/.cache/portage/tmp"
export DISTDIR="${HOME}/.cache/portage/distfiles"
export PORTAGE_GRPNAME="$(id -gn)"
mkdir -p "${PORTAGE_TMPDIR}" "${DISTDIR}"
```

### 2.2. Flujo de Comprobación Paso a Paso

1. **Generación de Manifest**:
   ```bash
   ebuild <archivo>.ebuild digest
   ```
   *(Asegura que el archivo `Manifest` refleje las sumas de verificación del paquete).*

2. **Control de Calidad Estático (QA)**:
   ```bash
   pkgcheck scan
   ```
   *(Ejecutar en la raíz del overlay o en el directorio del paquete. Valida sintaxis, metadatos, licencias y compatibilidad).*

3. **Ciclo de Construcción y Prueba Completo (sin tocar `/`)**:
   El comando `ebuild` permite ejecutar las fases de compilación e instalación en la imagen intermedia `${D}` (directorio temporal dentro de `PORTAGE_TMPDIR`), sin requerir root:
   ```bash
   PORTAGE_TMPDIR="${HOME}/.cache/portage/tmp" DISTDIR="${HOME}/.cache/portage/distfiles" PORTAGE_GRPNAME="$(id -gn)" \
   ebuild <archivo>.ebuild clean compile test install
   ```

   * **`clean`**: Limpia el directorio de compilación temporal anterior.
   * **`compile`**: Descomprime, aplica parches, configura y compila el código fuente.
   * **`test`**: Ejecuta la suite de pruebas del paquete (si `src_test` está implementada).
   * **`install`**: Instala los ficheros resultantes en el directorio imagen `${D}` (`${PORTAGE_TMPDIR}/portage/<categoría>/<paquete>/image/`).

4. **Inspección de la Imagen Instalada**:
   Verificar que los archivos, enlaces simbólicos y directorios se han colocado en las rutas correctas:
   ```bash
   find "${HOME}/.cache/portage/tmp/portage/" -type f
   ```

5. **Limpieza Final**:
   ```bash
   PORTAGE_TMPDIR="${HOME}/.cache/portage/tmp" PORTAGE_GRPNAME="$(id -gn)" ebuild <archivo>.ebuild clean
   ```

---

## 3. Ebuild Modification Rules

1. **Automatic Manifest Digest**:
   - **OBLIGATORIO**: Siempre que se cree o modifique CUALQUIER ebuild, ejecutar inmediatamente `ebuild <archivo>.ebuild digest` en el directorio del paquete (o con las variables de entorno en usuario). Sin excepciones.

2. **Integrated Ebuilds Protection**:
   - **NO modificar ebuilds integrados** procedentes de repositorios externos (por ejemplo, `app-crypt/autofirma-dnie`). Estos paquetes se mantienen externamente y se sincronizan a través de `integrating_from_other_repositories.sh`.

3. **Python Version Compatibility**:
   - Todos los ebuilds basados en Python deben soportar las versiones de `python3_12` a `python3_15`:
     ```bash
     PYTHON_COMPAT=( python3_{12..15} )
     ```

4. **Gentoo Code & Formatting Standards**:
   - **Indentación**: Usar tabuladores (no espacios) para indentar funciones, matrices multilínea (`SRC_URI`, `RDEPEND`, `DEPEND`) y bloques de código dentro de los ficheros `.ebuild`.
   - **Salto de línea final**: Asegurar que todos los archivos terminen con un salto de línea (`\n`).
   - **Descripciones**: La variable `DESCRIPTION` NO debe terminar con punto (`.`).
   - **USE Flags**:
     - Las USE flags locales deben documentarse en la etiqueta `<use>` dentro del `metadata.xml` del paquete.
     - No añadir USE flags locales al fichero global `profiles/use.desc`.

5. **Thin Manifest Policy**:
   - Este repositorio utiliza `thin-manifests = true` en `metadata/layout.conf`.
   - Los archivos `Manifest` solo deben registrar archivos fuente externos descargados (`DIST`).
   - Los paquetes sin descargas externas (por ejemplo, `virtual/*`, `acct-user/*`, `acct-group/*`) no crean ni requieren archivos `Manifest`.

---

## 4. Quality Assurance & Verification

- Antes de dar por finalizada la modificación o creación de un ebuild o metadata, ejecutar siempre:
  ```bash
  pkgcheck scan
  ```
  y solventar cualquier error o aviso de QA detectado.
