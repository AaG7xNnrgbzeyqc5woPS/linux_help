# see:
  	[镜像]镜像操作losetup  
  	https://www.cnblogs.com/aaronLinux/p/7503359.html  
  	深度好文,可以在镜像上安装文件系统,  chroot
  
  	通过kpartx方式挂载raw格式镜像
  	https://blog.csdn.net/cnyyx/article/details/27182833
  
  	注意:
   	我的理解, raw方式的镜像, 就是直接使用dd命令生成的镜像.
   
   
   
  


	$kpartx --help
	kpartx: invalid option -- '-'
	multipath-tools v0.8.3 (10/02, 2019)
	Usage:
  	kpartx [-a|-d|-u|-l] [-r] [-p] [-f] [-g] [-s|-n] [-v] wholedisk
		-a add partition devmappings
		-r devmappings will be readonly
		-d del partition devmappings
		-u update partition devmappings
		-l list partitions devmappings that would be added by -a
		-p set device name-partition number delimiter
		-g force GUID partition table (GPT)
		-f force devmap create
		-v verbose
		-n nosync mode. Return before the partitions are created
		-s sync mode (Default). Don't return until the partitions are created
  
  ----------------------------------------
  # 练习一:
  ----------------------------------
  
  	losetup -a
	/dev/loop0: []: (/home/john/mount_img/oz_mount.img)
		
	$ sudo kpartx -va /dev/loop0  /映射分区
	[sudo] password for john: 
	add map loop0p1 (254:0): 0 88262 linear 7:0 8192
	add map loop0p2 (254:1): 0 7639040 linear 7:0 98304
	
	$ ls /dev/mapper  查看映射分区
	control  loop0p1  loop0p2
	
	$ 格式化分区
	sudo mkfs.vfat /dev/mapper/loop0p1
	sudo mkfs.ext4 /dev/mapper/loop0p2
	(注意: 分区内有内容就不要格式化,会破坏数据的)
	
	
	$ ls /dev/mapper
	control  loop0p1  loop0p2
	
	//挂载分区到文件系统
	$ sudo mount /dev/mapper/loop0p1 /mnt/img1 挂载分区到文件系统
	[sudo] password for john: 
	
	$ sudo mount /dev/mapper/loop0p2 /mnt/img2
	
	$ ls /mnt/img1
	bcm2708-rpi-0-w.dtb       COPYING.linux     README
	bcm2708-rpi-b.dtb         fixup_cd.dat      ssh
	bcm2708-rpi-b-plus.dtb    fixup.dat         start_cd.elf
	bcm2708-rpi-cm.dtb        fixup_db.dat      start_db.elf
	  ......
	$ 
	
	$ls /mnt/img2
	bin  boot  common.sh  dev  etc  home  lib  lost+found  media  mnt  opt  proc  README  root  run  sbin  srv  sys  tmp  		usr  var
	$ 
	#  mount /mnt/img1, /mnt/img2 oK
	
	$sudo find . -name "whitecoind"
	./usr/local/bin/whitecoind
	
	$ ls -lh ./usr/local/bin/whitecoind
	-rwxr-xr-x 1 john john 2.6M Jun 12  2018 ./usr/local/bin/whitecoind
	
	#卸载 镜像文件
	cd ~
	$sudo umount /mnt/img2 /mnt/img1
	$
	
	#查看镜像分区
	ls /dev/mapper
	control  loop0p1  loop0p2
	
	#卸载镜像分区
	$ sudo kparkx -d /dev/loop0
	sudo: kparkx: command not found
	$ sudo kpartx -d /dev/loop0
	
	#查看 循环设备
	$ sudo losetup -a
	/dev/loop0: [2049]:1326070 (/home/john/mount_img/oz_mount.img)
	$ ls /mnt/mapper
	ls: cannot access '/mnt/mapper': No such file or directory
	$ ls /dev/mapper
	control
	
	#卸载循环设备
	$ sudo losetup -d /dev/loop0
	
	#查看循环设备卸载情况
	$ sudo losetup -a

	

	
	
	


	

  
  
  
