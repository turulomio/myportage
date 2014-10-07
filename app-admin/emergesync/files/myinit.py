#!/usr//bin/python3
import datetime, os, argparse

def s(command):
    os.system(command)

def ldd(program):
   """Function that gets a program or lib and gets all shared dependencies.
      They are added to saved set"""
   for line in os.popen("ldd -v {}".format(program)):
      if line.find("no es un ejecutable")>=0:
         return
      if line.find("Version information")>0:
         continue
      if line.find(":")>0:
         dep=line.strip().split(":")[0]
         if dep not in (saved):
            saved.add(dep)
###########################

dt=str(datetime.datetime.now()).split(".")[0].replace("-","").replace(" ","").replace(":","")
output="/tmp/myinit-{}/".format(dt)

parser=argparse.ArgumentParser("Initramfs generator for luks root partition")
parser.add_argument('-b', '--boot', help='Where /boot partition is', default='/dev/sda1')
parser.add_argument('-e', '--encrypted', help='Where encrypted device is', default='/dev/sda4')
args=parser.parse_args()

saved=set(["/bin/busybox", "/sbin/cryptsetup", "/sbin/fsck.ext4", "/lib/ld-linux-x86-64.so.2"])#long path, dictionary with all saved in path, all dependencies must be in this set

lastsetcount=0

initfile="""#!/bin/busybox sh
mount -t devtmpfs none /dev
mount -t proc proc /proc
mount -t sysfs sysfs /sys

echo 0 > /proc/sys/kernel/printk

fsck.ext4 {1}

cryptsetup luksOpen {0} root
fsck.ext4 /dev/mapper/root
mount /dev/mapper/root /newroot

umount /dev /proc /sys

if [[ -x "/newroot/sbin/init" ]] ; then
        exec switch_root /newroot /sbin/init
fi

echo "Failed to init Gentoo..."
""".format(args.encrypted, args.boot)

s("rm -Rf {}".format(output))
s("mkdir {}".format(output))

os.chdir(output)

#Make dirs
for d in ["bin", "dev", "etc", "lib64", "boot","mnt", "newroot", "proc", "root", "sbin", "sys","usr/bin","usr/lib64"]:
   s("mkdir -p {}/{}".format(output,d))
s("ln -s lib64 lib")
os.chdir(output+"/usr/")
s("ln -s lib64 lib")
os.chdir(output)
os.chdir(output+"/bin")
s("ln -s bash sh")
os.chdir(output)
s("cp -a /dev/null /dev/console /dev/tty /dev/sda1 /dev/sda4 {}/dev/".format(output))

#Create init file
f=open("{}/init".format(output),"w")
f.write(initfile)
f.close()
s("chmod 777 init")

#Search recursively dependencies
while lastsetcount!=len(saved):
   tmp=set(saved)
   lastsetcount=len(saved)
   for p in tmp:
      ldd(p)

#Copy files
for f in saved:
   s("cp  {0} {1}{0}".format(f, output))
   saved.add("{}".format(f))

#Create timestamp
s("touch '{}/{}.txt'".format(output,datetime.datetime.now()))

## Genera el fichero
s("find . -print0 | cpio --null -ov --format=newc > /tmp/myinit.cpio".format(output))#Cuidado no generarlo en el mismo sitio se grew
s("cat /tmp/myinit.cpio | gzip -9 > /boot/myinit.gz".format(output))






#echo "Collecting the shared library dependencies for $1..."
#deps=$(ldd $1 | awk 'BEGIN{ORS=" "}$1~/^\//{print $1}$3~/^\//{print $3}' | sed 's/,$/\n/')
