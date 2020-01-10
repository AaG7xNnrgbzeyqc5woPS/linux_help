see:
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
	
	$

	

  
  
  
