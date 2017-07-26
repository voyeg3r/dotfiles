### Intro

Network file system utility


### Display all exported file systems from an NFS server
+ https://www.cyberciti.biz/faq/howto-see-shares-on-nfs-server-exported-filesystems/

Type following the command to list shared directories from an nfs server called
nas03 (IP address 192.168.1.12): [Warning: Command must be run as the root
user.] WARNING! You must run ‘showmount -e’ command as the root user. Switch to
the root user by typing su – and entering the root password, when prompted.

    showmount -e 192.168.1.12

OR use server name such as nas03 or netapp03 or filer03:

    showmount -e nas03

Sample outputs:

``` sh
Export list for nas03:
/volume1/multimedia 192.168.1.0/24
/volume1/sales 192.168.1.0/24
/volume2/users 192.168.1.0/24
```

In this example /volume1/multimedia, /volume1/sales, and /volume1/users are
shared on an NFS server. You can mount shared nfs directory called
/volume1/multimedia from nas03 nfs server using the mount command, enter:

    # mkdir /mnt/nfs
    # mount -t nfs nas03:/volume1/multimedia /mnt/nfs

