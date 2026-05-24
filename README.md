# How to install this repository

## Add an entry to [/etc/portage/repos.conf](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)

```
[myportage]
location = /usr/local/overlays/myportage
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ set this to any location you want
sync-uri = https://github.com/turulomio/myportage.git
sync-type = git
auto-sync = yes
```

## Sync overlay
Ejecute this command in console 

`emerge --sync myportage`

## To mantain this portage

Use `dev-util/pkgcheck`

```bash 
cd /ruta/de/tu/overlay
pkgcheck scan myportage
```