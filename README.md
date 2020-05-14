# How to install this repository

## 1. Add an entry to [/etc/portage/repos.conf](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)

```
[myportage]
location = /usr/local/overlays/myportage
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ set this to any location you want
sync-uri = https://github.com/turulomio/myportage.git
sync-type = git
auto-sync = yes
```

## 2. Sync overlay
Ejecute this command in console 

`emerge --sync myportage`

<style>
img { vertical-align:middle; }
</style>

# List of ebuilds
## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-accessibility/onboard">app-accessibility/onboard</a><a href="https://launchpad.net/onboard"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Onscreen keyboard for everybody who can't use a hardware keyboard


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/filenamelength">app-admin/filenamelength</a><a href="https://github.com/turulomio/${PN}"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Admin options to work with the max length of the name of your files


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/myemerge">app-admin/myemerge</a><a href="https://github.com/turulomio/${PN}"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

My emerge sync procedure


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/mykernel">app-admin/mykernel</a><a href="https://github.com/turulomio/${PN}"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

My gentoo kernel compilation script


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/myphone-svn">app-admin/myphone-svn</a><a href="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/myphone"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Scripts de acceso a mis teléfonos móviles


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/recpermissions">app-admin/recpermissions</a><a href="https://github.com/Turulomio/recpermissions"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script to change permissions and owner recursivily from current directory


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/renamebyreplace">app-admin/renamebyreplace</a><a href="https://github.com/Turulomio/renamebyreplace"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Remove innecesary files finding datetime patterns in filename


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/sshadvice">app-admin/sshadvice</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script que detecta las conexiones ssh en el sistema y genera avisos


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/swapping_ebuilds">app-admin/swapping_ebuilds</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Detects swapping ebuilds and log them in /var/lib/


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-admin/toomanyfiles">app-admin/toomanyfiles</a><a href="https://github.com/Turulomio/toomanyfiles"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Remove innecesary files finding datetime patterns in filename


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-antivirus/mail-clamav-report">app-antivirus/mail-clamav-report</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script que envia por correo el analisis del disco duro


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-crypt/rarcrack">app-crypt/rarcrack</a><a href="http://rarcrack.sourceforge.net/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Rar password cracker


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-editors/visual-studio-code">app-editors/visual-studio-code</a><a href="https://code.visualstudio.com"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Multiplatform Visual Studio Code from Microsoft


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-forensics/nsrl">app-forensics/nsrl</a><a href="http://www.nsrl.nist.gov/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

The National Software Reference Library (NSRL) is designed to collect software from various sources and incorporate file profiles computed from this software into a Reference Data Set (RDS) of information


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-forensics/recovermypartition">app-forensics/recovermypartition</a><a href="http://recovermypartition.sourceforge.net"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Makes forensics from a partition


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/bluenmea-client">app-misc/bluenmea-client</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Scripts to conect to bluenmea in a device, and launch gpsd


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/caloriestracker">app-misc/caloriestracker</a><a href="https://github.com/turulomio/caloriestracker"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Calories tracker system


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/gpswarning">app-misc/gpswarning</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Programa que avisa de radares


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/kdepim2google">app-misc/kdepim2google</a><a href="http://sourceforge.net/projects/kdepim2google/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Utils to integrate kdepim information to google.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/navit">app-misc/navit</a><a href="http://www.navit-project.org"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

An open-source car navigation system with a routing engine


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/navit-mytools-svn">app-misc/navit-mytools-svn</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

My tools for navit


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-misc/odttranslate">app-misc/odttranslate</a><a href="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/odttranslate"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Scripts de traducción de ficheros odt


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-mobilephone/scrcpy">app-mobilephone/scrcpy</a><a href="https://blog.rom1v.com/2018/03/introducing-scrcpy/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Display and control your Android device


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-office/didyoureadme">app-office/didyoureadme</a><a href="https://github.com/Turulomio/didyoureadme"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

System to control who and when a group reads a document send by mail. It uses postgresql to store information


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-office/xulpymoney">app-office/xulpymoney</a><a href="https://github.com/Turulomio/xulpymoney"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Home and financial accounting system


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-text/foliate">app-text/foliate</a><a href="https://johnfactotum.github.io/foliate/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

A simple and modern GTK eBook reader


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-text/omegat">app-text/omegat</a><a href="http://www.omegat.org/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Open source computer assisted translation (CAT) tool written in Java.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/app-text/scan2pdf-svn">app-text/scan2pdf-svn</a><a href="https://xulpymoney.svn.sourceforge.net/svnroot/xulpymoney/scan2pdf"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Genera un pdf con un escaneo


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-db/autodoc">dev-db/autodoc</a><a href="https://github.com/astsam/rtl8812au"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

A filename renaming utility based on perl regular expression


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-perl/Email-Outlook-Message">dev-perl/Email-Outlook-Message</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Read Outlook .msg files


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/PyQtChart">dev-python/PyQtChart</a><a href="https://www.riverbankcomputing.com/software/pyqtchart/intro"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python bindings for the Qt Chart framework


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/cx-oracle">dev-python/cx-oracle</a><a href="http://www.python.net/crew/atuining/cx_Oracle/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python extension module that allows access to Oracle Databases


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/cx_Freeze">dev-python/cx_Freeze</a><a href="http://cx-freeze.sourceforge.net"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Create standalone executables from Python scripts


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/django-sitetree">dev-python/django-sitetree</a><a href="https://github.com/idlesign/django-sitetree"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Menu tree with permisions


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/mangenerator">dev-python/mangenerator</a><a href="https://sourceforge.net/projects/mangenerator/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python module to generate man documentation


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/npyscreen">dev-python/npyscreen</a><a href="https://github.com/npcole/npyscreen"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

ncurses widgets


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/officegenerator">dev-python/officegenerator</a><a href="https://github.com/turulomio/${PN}"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python module to generate MS Office and LibreOffice files


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/pdf2odt">dev-python/pdf2odt</a><a href="https://github.com/turulomio/pdf2odt"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Converts a PDF file to LibreOffice Writer document


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/pyautogui">dev-python/pyautogui</a><a href="https://github.com/asweigart/pyautogui"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 




## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-python/ttyrecgenerator">dev-python/ttyrecgenerator</a><a href="https://sourceforge.net/projects/ttyrecgenerator/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python module to save console output and create GIF or video


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/dev-util/eric6">dev-util/eric6</a><a href="https://eric-ide.python-projects.org/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Python IDE


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-action/openclonk">games-action/openclonk</a><a href="http://openclonk.org/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

A free multiplayer action game where you control clonks


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-arcade/ardentryst">games-arcade/ardentryst</a><a href="http://jordan.trudgett.com/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Ardentryst is an action/RPG sidescoller, focused not just on fighting, but on story, and character development.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-arcade/edgar">games-arcade/edgar</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

When Edgar's father fails to return home after venturing out one dark and stormy night, Edgar fears the worst: he has been captured by the evil sorcerer who lives in a fortress beyond the forbidden swamp.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-arcade/plee-the-bear">games-arcade/plee-the-bear</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 




## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-arcade/xdriller">games-arcade/xdriller</a><a href="http://xdriller.sourceforge.net/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Xdriller is a portable Puzzle/Arcade video game. Xdriller is based on the gameplay of the Mr. Driller series, where you have to drill through Tetris-like screens of blocks and collect power-ups while avoiding being squashed by falling blocks


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-board/glparchis">games-board/glparchis</a><a href="https://github.com/Turulomio/glparchis"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

OpenGL Parchis


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-emulation/sdlmame">games-emulation/sdlmame</a><a href="http://mamedev.org/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Multiple Arcade Machine Emulator + Multi Emulator Super System (MESS)


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-engines/flare-engine">games-engines/flare-engine</a><a href="https://github.com/flareteam/flare-game"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Free/Libre Action Roleplaying game


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-fps/pink-pony">games-fps/pink-pony</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Pink Pony is a Tron­-like multiplayer racing­ game. 


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-puzzle/nimuh">games-puzzle/nimuh</a><a href="https://github.com/turulomio/nimuh"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Nimuh is a game about Andalucía


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-rpg/flare-game">games-rpg/flare-game</a><a href="https://github.com/flareteam/flare-game"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Free/Libre Action Roleplaying game


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/games-sports/dustrac">games-sports/dustrac</a><a href="https://github.com/juzzlin/DustRacing2D"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Dust Racing (Dustrac) is a tile-based, cross-platform 2D racing game written in Qt (C++) and OpenGL.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/mail-client/mailme">mail-client/mailme</a><a href="http://turulomio.users.sourceforge.net"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script que envia un correo rapidamente desde consola


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/mail-client/msg2eml">mail-client/msg2eml</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Converts msg outook to eml ascii mail


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-gfx/pdf2img">media-gfx/pdf2img</a><a href="http://turulomio.users.sourceforge.net/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Covierte un pdf a imágenes en una carpeta nueva


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-gfx/xps2img">media-gfx/xps2img</a><a href="http://xps2img.sourceforge.net/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

XPS (XML Paper Specification) document to set of images command-line conversion utility


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-libs/libclaw">media-libs/libclaw</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 




## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-sound/pyradio">media-sound/pyradio</a><a href="http://www.coderholic.com/pyradio"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

 Command line internet radio player


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/asciinema2gif">media-video/asciinema2gif</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Convert asciinerama cast to animated gif


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/mymoviebook">media-video/mymoviebook</a><a href="https://github.com/turulomio/mymoviebook"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Generate your personal movie collection book 


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/opensubtitlesdownload">media-video/opensubtitlesdownload</a><a href="https://emeric.io/OpenSubtitlesDownload"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Automatically find and download the right subtitles for your favorite videos!


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/ttygif">media-video/ttygif</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Convert ttyrec to animated gif


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/webcam-snapshot">media-video/webcam-snapshot</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Makes a webcam snapshot from console


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/media-video/wtv2mpg">media-video/wtv2mpg</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Converter wtv to mpg


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-analyzer/devicesinlan">net-analyzer/devicesinlan</a><a href="https://github.com/Turulomio/devicesinlan"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Show devices in a lan. You can enter your known devices, in order to detect strange devices.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-p2p/mldonkey">net-p2p/mldonkey</a><a href="https://github.com/ygrek/mldonkey"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Multi-network P2P application written in Ocaml, with Gtk, web & telnet interface


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/bettercap">net-wireless/bettercap</a><a href="https://github.com/bettercap/bettercap/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

A complete, modular, portable and easily extensible MITM framework


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/cowpatty">net-wireless/cowpatty</a><a href="http://www.willhackforsushi.com/?page_id50"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

WLAN tools for bruteforcing 802.11 WPA/WPA2 keys


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/hcxdumptool">net-wireless/hcxdumptool</a><a href="https://github.com/ZerBea/hcxdumptool"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Small tool to capture packets from wlan devices


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/hcxtools">net-wireless/hcxtools</a><a href="https://github.com/ZerBea/hcxtools"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Portable solution for capturing wlan traffic and conversion to hashcat formats


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/jazzteldecrypter">net-wireless/jazzteldecrypter</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Hacking wep


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/pixiewps">net-wireless/pixiewps</a><a href="https://github.com/wiire-a/pixiewps"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Pixiewps is a tool written in C used to bruteforce offline the WPS pin exploiting the low or non-existing entropy of some APs (pixie dust attack).


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/rtl8812au">net-wireless/rtl8812au</a><a href="https://github.com/astsam/rtl8812au"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/rtl88x2bu">net-wireless/rtl88x2bu</a><a href="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/wifite2">net-wireless/wifite2</a><a href="https://github.com/derv82/wifite2"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Rewrite of the popular wireless network auditor, wifite 


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/wlandecrypter">net-wireless/wlandecrypter</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Hacking wep


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/net-wireless/wpamagickey">net-wireless/wpamagickey</a><a href="http://www.seguridadwireless.net"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Generador de claves wpa para Wlan_XXXX, Jazztel_XXXX.


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/sci-mathematics/gretl">sci-mathematics/gretl</a><a href="http://gretl.sourceforge.net/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Regression, econometrics and time-series library


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/sci-mathematics/rstudio">sci-mathematics/rstudio</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

IDE for the R language


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/sys-apps/spoken-uptime">sys-apps/spoken-uptime</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Speak system uptime


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-apps/gitbucket-bin">www-apps/gitbucket-bin</a><a href="https://github.com/gitbucket/gitbucket"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

An open-source git service


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-apps/monolith">www-apps/monolith</a><a href="https://github.com/Y2Z/monolith"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Save HTML pages with ease


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-apps/qrcp">www-apps/qrcp</a><a href="https://github.com/claudiodangelis/qrcp/"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-apps/save_url">www-apps/save_url</a><a href="https://github.com/turulomio/save_url"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script to save and url in a single file with an automatic and structured name. It uses monolith as its backend


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-apps/sqlmap">www-apps/sqlmap</a><a href=""><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

A SQL Injection Tool


## <img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/directory.png" alt="centered image" width="5%" /> <a href="https://github.com/turulomio/myportage/tree/master/www-client/firefox_newuser">www-client/firefox_newuser</a><a href="https://github.com/turulomio/${PN}"><img src="https://raw.githubusercontent.com/turulomio/gentoo_overlay_autodoc/master/gentoo_overlay_autodoc/images/home.png" alt="centered image" width="5%" /></a> 

Script to launch firefox in a recently created user. It deletes user after closing firefox


<p style='text-align: right;'>This page has been autogenerated with <a href="https://github.com/turulomio/gentoo_overlay_autodoc">Gentoo Overlay Autodoc</a></p>
