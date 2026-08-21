# How to install this repository

## Add an entry to [/etc/portage/repos.conf](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)

Create `/etc/portage/repos.conf/myportage.conf`:

```ini
[myportage]
location = /var/db/repos/myportage
#          ^^^^^^^^^^^^^^^^^^^^^^^ set this to any location you want
sync-uri = https://github.com/turulomio/myportage.git
sync-type = git
auto-sync = yes
```

## Sync overlay

Execute one of these commands in console:

```bash
emaint sync -r myportage
# or
emerge --sync myportage
```

## Maintain this overlay

Use `dev-util/pkgcheck` to scan the repository for quality and policy issues:

```bash 
cd /path/to/myportage
pkgcheck scan
```

### Utility Scripts

- **`add_release_all.sh`**: Increment revision numbers (`-r1`, `-r2`, ...) for all ebuilds in the repository and update Manifests.
- **`digest_all.sh`**: Run `ebuild digest` across all ebuilds in the overlay repository to update Manifests.
- **`integrating_from_other_repositories.sh`**: Sync and integrate ebuilds directly from external GitHub tree URLs.


### Thin Manifests

Este overlay utiliza `thin-manifests = true` en `metadata/layout.conf` siguiendo las recomendaciones de Gentoo para repositorios basados en Git:

- Los archivos `Manifest` solo contienen checksums de archivos descargables externos (`DIST`).
- Los archivos ebuild, `metadata.xml` y ficheros auxiliares son rastreados por Git y no requieren entradas en `Manifest`.
- Los paquetes que no descargan fuentes externas (como paquetes `virtual/*`, `acct-user/*` o `acct-group/*`) no generan ni necesitan archivo `Manifest`.

### Actualización de Manifests

Cada vez que se modifique o añada un ebuild en el repositorio, se debe regenerar el archivo `Manifest` ejecutando:

```bash
cd /ruta/al/paquete
ebuild <fichero-ebuild>.ebuild digest
```


## Agradecimientos / External Contributions

Este repositorio incluye ebuilds integrados y sincronizados desde otros repositorios de Gentoo. Reconocemos y agradecemos la contribución de sus autores:

* **[app-crypt/autofirma-dnie](app-crypt/autofirma-dnie)**: Integrado desde el repositorio [jrubioh1/j-overlay](https://github.com/jrubioh1/j-overlay) ([ver ebuild en GitHub](https://github.com/jrubioh1/j-overlay/tree/main/app-crypt/autofirma-dnie)).