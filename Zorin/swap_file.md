# use swap_file for 8G swap
- [Swap](https://wiki.archlinux.org/title/swap)

```
$ swapon --show
$ free -h
$ sudo swapoff -a 
$ free -h

## 8G swap file /swapfile
$ sudo dd if=/dev/zero of=/swapfile bs=1M count=8192 status=progress  
$ sudo chmod 0600 /swapfile
$ ls -l /swapfile

$ sudo mkswap /swapfile
$ sudo swapon /swapfile

### add new line for 8G swapfile, and delete old swap partition.
$ sudo nano /etc/fstab
/swapfile none swap defaults 0 0

### reboot computer for test fstab if ok.
$ reboot 

```

Test is OK! Good Job!
This is easy way!

