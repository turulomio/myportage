#!/usr//bin/python3
import datetime, os
dt=str(datetime.datetime.now()).split(".")[0].replace("-","").replace(" ","").replace(":","")
output="/tmp/myinit-{}".format(dt)

def s(command):
    os.system(command)

saved=set([])#long path, dictionary with all saved in path, all dependencies must be in this set


initfile="""#!/bin/sh

#Mount things needed by this script
mount -t proc proc /proc
mount -t sysfs sysfs /sys

#Disable kernel messages from popping onto the screen
echo 0 > /proc/sys/kernel/printk

#Clear the screen
#clear
#Create all the symlinks to /bin/busybox
busybox --install -s

#Create device nodes
mknod /dev/null c 1 3
mknod /dev/tty c 5 0
mknod /dev/urandom c 1 9
echo /bin/mdev > /proc/sys/kernel/hotplug
mdev -s

#Function for parsing command line options with "=" in them
# get_opt("init=/sbin/init") will return "/sbin/init"
get_opt() {
        echo "$@" | cut -d "=" -f 2
}

#Defaults
init=/sbin/init
root=/dev/mapper/encroot
enc_root=/dev/sda4

#Process command line options
for i in $(cat /proc/cmdline); do
        case "${i}" in
                root\=*)
                        root=$(get_opt $i)
                        ;;
                init\=*)
                        init=$(get_opt $i)
                        ;;
                enc_root\=*)
                        enc_root=$(get_opt $i)
                        ;;
        esac
done

#Checking /dev/sda1
echo "HMAC Password";
mount /dev/sda1 /mnt
read -r a
hmac256 $a /mnt/vmlinuz
hmac256 $a /mnt/initramfs.gz
umount /mnt

#Open encrypted partition to create /dev/mapper/enc-pv
cryptsetup luksOpen "${enc_root}" encroot

#Get LVM volumes up
#lvm vgchange -a y

#Mount the root device
/bin/fsck.ext4 /dev/mapper/encroot
mount /dev/mapper/encroot /newroot

#Unmount all other mounts so that the ram used by
#the initramfs can be cleared after switch_root
umount /sys /proc


#Switch to the new root and execute init
if [[ -x "/newroot/sbin/init" ]] ; then
        exec switch_root /newroot /sbin/init
fi

#This will only be run if the above line failed
echo "Failed to switch_root, dropping to a shell"
exec sh
"""

s("rm -Rf {}".format(output))
s("mkdir {}".format(output))
os.chdir(output)

#Make dirs
for d in ["bin", "dev", "etc", "lib", "mnt", "newroot", "proc", "root", "sbin", "sys","usr/bin"]:
   s("mkdir -p {}/{}".format(output,d))

#Create init file
f=open("{}/init".format(output),"w")
f.write(initfile)
f.close()

files=["/bin/bash", "/bin/bb",  "/bin/busybox",  "/bin/cat",  "/sbin/cryptsetup",  "/bin/cut",  "/sbin/e2fsck",  "/sbin/fsck.ext4",  "/usr/bin/hmac256",  "/usr/bin/mdev",  "/bin/mknod",  "/bin/mount",  "/bin/sh",  "/sbin/udevadm",  "/bin/umount"]
for f in files:
   s("cp {0} {1}{0}".format(f, output))
   saved.add("{}{}".format(output,f))


## Genera el fichero
s("find . | cpio -H newc -o > {}/initramfs.cpio".format(output))
s("cat {0}/initramfs.cpio | gzip > {0}/initramfs.updated.gz".format(output))
#s("rm {}/initramfs.cpio".format(output))
#s("mv initramfs.updated.gz /boot/")






#echo "Collecting the shared library dependencies for $1..."
#deps=$(ldd $1 | awk 'BEGIN{ORS=" "}$1~/^\//{print $1}$3~/^\//{print $3}' | sed 's/,$/\n/')
