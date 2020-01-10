

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

  
  
  
