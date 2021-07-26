原文:
[Linux 下检测磁盘的各种方式](https://www.jianshu.com/p/6020d4fbcde2)

# 大概流程

    使用dmesg检查是否有关于磁盘错误的信息，如下： end_request: I/O error, dev 03:06 (sda), sector 。
    从上面的输出我们判定扇区可能出现了问题，使用badblocks -s -v -o /root/badblocks.log /dev/sda 检查硬盘是否产生坏道并输出到badblocks.log中。log大约是这样的模式：64039224 64039240 64039241 64039242 64039243 64039256 64039257 64039258 64039259 687056
    可修复坏道方法：
            使用 badblocks -s -w /dev/sda END START，END代表需要修复的扇区末端，START代表需要修复的扇区起始端。
            使用fsck -a /dev/sda1
    磁盘坏道分为三种：0磁道坏道，逻辑坏道，硬盘坏道。其中逻辑坏道可以使用上面的方法修复，0磁道坏道的修复方法是隔离0磁道，使用fdsk划分区的时候从1磁道开始划分区。如果是硬盘坏道的话，只能隔离不能修复。
    硬盘坏道的监测方法：使用上述方法检测修复后，再使用badblocks -s -v -o /root/badblocks.log /dev/sda监测看是否还有坏道存在，如果坏道还是存在的话说明坏道属于硬盘坏道。硬盘坏道隔离方法，首先记录监测出的硬盘坏道，然后分区的时候把硬盘坏道所在的扇区分在一个分区（大小一般大于坏扇区大小），划分出的坏道分区不使用即可达到隔离的目的。隔离只是暂时方案，建议尽快更换硬盘，因为坏道会扩散，以免以后出现严重的数据问题。


# 查看硬盘详细信息
# smartctl的disk路径和名字可以通过命令
[root@localhost ~]# cat /proc/partitions

[root@localhost ~]# smartctl -d ata -a /dev/sda 
smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.10.0-327.36.3.el7.x86_64] (local build)
Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Device Model:     MTFDDAK512MBF-xx
Serial Number:    xxx
LU WWN Device Id: xxx
Firmware Version: xxx
User Capacity:    512,110,190,592 bytes [512 GB]
Sector Size:      512 bytes logical/physical
Rotation Rate:    Solid State Device
Device is:        Not in smartctl database [for details use: -P showall]
ATA Version is:   ACS-3 (unknown minor revision code: 0x011b)
SATA Version is:  SATA >3.1, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Wed Dec  6 10:22:40 2017 CST
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

从Device Model中，可以知道，我的硬盘是MTFDDAK512MBF，在网址google一下，就知道它是Micron产的，具体的内容为了安全考虑，我就不贴出来了。
查看更多硬盘信息
# 查看挂接的分区状态
[root@localhost ~]# fdisk -l |grep Disk
Disk /dev/sda: 107.4 GB, 107374182400 bytes, 209715200 sectors
Disk label type: dos
Disk identifier: 0x00014b65
# 查看硬盘和分区分布
[root@localhost ~]# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0  100G  0 disk 
├─sda1   8:1    0  300M  0 part /boot
├─sda2   8:2    0    2G  0 part [SWAP]
└─sda3   8:3    0 97.7G  0 part /
sr0     11:0    1 1024M  0 rom
# 查看硬盘和分区的详细信息
[root@localhost ~]# fdisk -l  

Disk /dev/sda: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x00014b65

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048      616447      307200   83  Linux
/dev/sda2          616448     4812799     2098176   82  Linux swap / Solaris
/dev/sda3         4812800   209715199   102451200   83  Linux
# 查看挂接的分区状态
[root@localhost ~]# mount | column -t
sysfs        on  /sys                             type  sysfs        (rw,nosuid,nodev,noexec,relatime)
proc         on  /proc                            type  proc         (rw,nosuid,nodev,noexec,relatime)
devtmpfs     on  /dev                             type  devtmpfs     (rw,nosuid,size=916724k,nr_inodes=229181,mode=755)
securityfs   on  /sys/kernel/security             type  securityfs   (rw,nosuid,nodev,noexec,relatime)
tmpfs        on  /dev/shm                         type  tmpfs        (rw,nosuid,nodev)

# 查看挂接的分区状态
[root@localhost ~]# swapon -s 
Filename                                Type            Size    Used    Priority
/dev/sda2                               partition       2098172 112392  -1

# 查看硬盘使用情况
[root@localhost ~]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/sda3      xfs        98G   18G   81G  18% /
devtmpfs       devtmpfs  896M     0  896M   0% /dev
tmpfs          tmpfs     911M   20K  911M   1% /dev/shm
tmpfs          tmpfs     911M   10M  901M   2% /run
tmpfs          tmpfs     911M     0  911M   0% /sys/fs/cgroup
/dev/sda1      xfs       297M  148M  150M  50% /boot
tmpfs          tmpfs     183M     0  183M   0% /run/user/1002

# 或者查看文件 /etc/fstab
[root@localhost ~]# cat  /etc/fstab
查看系统硬件信息

参考：https://www.cnblogs.com/cloudos/p/8416415.html
# 查看服务器型号、序列号
[root@localhost ~]# dmidecode|grep "System Information" -A9|egrep  "Manufacturer|Product|Serial" 
        Manufacturer: VMware, Inc.
        Product Name: VMware Virtual Platform
        Serial Number: VMware-56 4d 70 7a 9e 28 b7 ce-52 ca 33 25 b4 29 83 98
# 查看主板型号
[root@localhost ~]# dmidecode |grep -A16 "System Information$"
System Information
        Manufacturer: VMware, Inc.
        Product Name: VMware Virtual Platform
        Version: None
        Serial Number: VMware-56 4d 70 7a 9e 28 b7 ce-52 ca 33 25 b4 29 83 98
        UUID: 7A704D56-289E-CEB7-52CA-3325B4298398
        Wake-up Type: Power Switch
        SKU Number: Not Specified
        Family: Not Specified

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: Intel Corporation
        Product Name: 440BX Desktop Reference Platform
        Version: None
        Serial Number: None
        Asset Tag: Not Specified
# 查看BIOS信息
[root@localhost ~]# dmidecode -t bios
# dmidecode 3.0
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.
....
# 查看内存槽及内存条
[root@localhost ~]# dmidecode -t memory | head -45 | tail -23
# 查看网卡信息
[root@localhost ~]# dmesg | grep -i Ethernet
# 查看pci信息，即主板所有硬件槽信息
[root@localhost ~]# lspci | head -10

查看文件系统格式
工具1： linux dmesg

dmesg 可以查看linux 内核信息。
dmesg’命令设备故障的诊断是非常重要的。在‘dmesg’命令的帮助下进行硬件的连接或断开连接操作时，我们可以看到硬件的检测或者断开连接的信息。‘dmesg’命令在多数基于Linux和Unix的操作系统中都可以使用。
1.1 列出加载到内核中的所有驱动

我们可以使用如‘more’。 ‘tail’, ‘less ’或者‘grep’文字处理工具来处理‘dmesg’命令的输出。由于dmesg日志的输出不适合在一页中完全显示，因此我们使用管道（pipe）将其输出送到more或者less命令单页显示。
[root@localhost ~]# dmesg |more  
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[root@localhost ~]# dmesg | less
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
1.2 列出所有被检测到的硬件

要显示所有被内核检测到的硬盘设备，你可以使用‘grep’命令搜索‘sda’关键词，如下
[root@localhost ~]# dmesg |grep sda
[    4.108878] sd 0:0:0:0: [sda] 209715200 512-byte logical blocks: (107 GB/100 GiB)
[    4.108906] sd 0:0:0:0: [sda] Write Protect is off
[    4.108908] sd 0:0:0:0: [sda] Mode Sense: 61 00 00 00
[    4.108964] sd 0:0:0:0: [sda] Cache data unavailable
[    4.108965] sd 0:0:0:0: [sda] Assuming drive cache: write through
[    4.110296]  sda: sda1 sda2 sda3
[    4.110746] sd 0:0:0:0: [sda] Attached SCSI disk
[    5.162611] XFS (sda3): Mounting V5 Filesystem
[    5.423126] XFS (sda3): Ending clean mount
[   16.272858] Adding 2098172k swap on /dev/sda2.  Priority:-1 extents:1 across:2098172k FS
[   16.625149] XFS (sda1): Mounting V5 Filesystem
[   17.373245] XFS (sda1): Ending clean mount

‘sda’表示第一块 SATA硬盘，‘sdb’表示第二块SATA硬盘。若想查看IDE硬盘搜索‘hda’或‘hdb’关键词。

由于‘dmesg’命令的输出实在太长了，在其中搜索某个特定的字符串是非常困难的。因此，有必要过滤出一些包含‘usb’ ‘dma’ ‘tty’ ‘memory’等字符串的日志行。grep 命令 的‘-i’选项表示忽略大小写。
[root@localhost ~]# dmesg | grep -i memory
1.3 实时监控dmesg日志输出
[root@localhost ~]# tail -f /var/log/dmesg
工具2：mcelog

参考：http://www.cnblogs.com/muahao/p/6003910.html

    mcelog 是 x86 的 Linux 系统上用来 检查硬件错误，特别是内存和CPU错误的工具。

    有三种运行的方式，cron，daemon，trigger。

        cron,最老的方式，有确定，定时任务，会丢失一些
        daemon，el7上用这种
        trigger，高级一点的方式，触发的时候，看man mcelog

    cron是最low的方式，会丢失，trigger是比较高级的方式，触发的。一般我们在el6.el7上都是用daemon的方式。

    el6上默认应该是使用cron，每小时运行一次，也可以使用daemon守护进程的方式（需要手动执行mcelog --daemon），默认日志打到/var/log/mcelog,和/var/log/message.

    el7上默认使用mcelog.service启动的，相当于daemon守护进程的方式，但是，默认日志只打到和/var/log/message，然而默认/var/log/mcelog文件不存在，这个需要在启动命令种加上--logfile=/var/log/mcelog才可以。

    如何模拟硬件错误验证mcelog是否运行正常？
        有一个工具叫:mceinject ,mcetest,参见下文的案例2

可纠正和不可纠正的硬件错误统称为机器检查异常 (MCE)。CPU 自身能够纠正错误，并通知底层操作系统与 CPU 或缓存有关的问题。CPU 本身还能从某些错误中恢复。Oracle Linux 可将 mcelog 用作机器检查的日志子系统。首先，必须使用以下命令在服务器上安装软件包。
安装/启动：
yum install mcelog.x86_64
service mcelogd start
chkconfig mcelogd on

or
mcelog --daemon

or
systemctl restart mcelog.service

mcelog 能捕获两类错误：已纠正的 和未纠正的。已纠正的错误是由 CPU 处理的事件，可用来识别可能预测更大问题的趋势。

未纠正的错误是关键异常，如果 CPU 无法恢复，往往会导致系统上的内核错误。这会导致应用程序重置和中断。对于未纠正的错误，mcelog 捕获错误的能力取决于错误导致热重启还是硬重启。如果是热重启，信息会被 mcelog 捕获，恢复后可看到。硬重启会导致数据丢失，而且 mcelog 可能捕获不到该事件。

为了进行测试和故障排除，可以使用 mce-test 包生成假的硬件 MCE 事件并执行系统测试。

mce-test 软件包含丰富的默认测试，能模拟真实硬件故障，甚至会导致内核错误。需要执行几个配置步骤才能对系统进行此类测试。

首先，需要安装几个支持软件包才能在测试系统上配置 mce-test。使用以下命令：
yum install gcc.x86_64 gcc-c++.x86_64 flex.x86_64 dialog.x86_64 ras-utils.x86_64 git.x86_64
mcelog相关文件

/dev/mcelog 设备文件

/var/log/mcelog messages日志文件

/etc/mcelog/mcelog.conf配置文件

/var/run/mcelog.pid

默认故障日志只记录在/var/log/mcelog，并不记录到系统日志中。
如果需要在系统日志中也体现，需修改/etc/mcelog/mcelog.conf文件，将前面#去掉，并保存。
# log output options
# Log decoded machine checks in syslog (default stdout or syslog for daemon)
#syslog = yes
# Log decoded machine checks in syslog with error level
#syslog-error = yes
# Never log anything to syslog
#no-syslog = yes
# Append log output to logfile instead of stdout. Only when no syslog logging is active
#logfile = filename
查看日志
[root@localhost ~]# mcelog --ascii --file /var/log/mcelog |tail
[root@localhost ~]# tail /var/log/mcelog
工具3：badblock
[root@localhost ~]# badblocks -v /dev/sda1 > badsectors.txt  
Checking blocks 0 to 307199
Checking for bad blocks (read-only test): 
done                                                 
Pass completed, 0 bad blocks found. (0/0/0 errors)

上面的命令中，badblocks 扫描设备/dev/sda10（记得指定你的实际设备），-v选项让它显示操作的详情。另外，这里使用了输出重定向将操作结果重定向到了文件badsectors.txt。

如果你在你的磁盘上发现任何坏道，卸载磁盘并像下面这样让系统不要将数据写入回报的扇区中。

你需要执行e2fsck（针对 ext2/ext3/ext4 文件系统）或fsck命令，命令中还需要用到badsectors.txt文件和设备文件。

-l 选项告诉命令将在指定的文件 badsectors.txt 中列出的扇区号码加入坏块列表。
# 针对 for ext2/ext3/ext4 文件系统
[root@localhost ~]# e2fsck -l badsectors.txt /dev/sda1
e2fsck 1.42.9 (28-Dec-2013)
/dev/sda is in use.
e2fsck: Cannot continue, aborting.

# 针对其它文件系统
[root@localhost ~]# fsck -l badsectors.txt /dev/sda1
fsck from util-linux 2.23.2
If you wish to check the consistency of an XFS filesystem or
repair a damaged filesystem, see xfs_repair(8).
工具4：硬盘检测命令smartctl
[root@localhost ~]# smartctl -a /dev/sda
smartctl 6.5 2016-05-07 r4318 [x86_64-linux-3.10.0-862.el7.x86_64] (local build)
Copyright (C) 2002-16, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Vendor:               VMware,
Product:              VMware Virtual S
Revision:             1.0
User Capacity:        107,374,182,400 bytes [107 GB]
Logical block size:   512 bytes
Device type:          disk
Local Time is:        Sun Mar  3 22:30:34 2019 PST
SMART support is:     Unavailable - device lacks SMART capability.

=== START OF READ SMART DATA SECTION ===
Current Drive Temperature:     0 C
Drive Trip Temperature:        0 C

Error Counter logging not supported

Device does not support Self Test logging

# 参数 -H 或 --health 以显示 SMART 整体健康自我评估测试结果
[root@localhost ~]# smartctl -H /dev/sda1
smartctl 6.5 2016-05-07 r4318 [x86_64-linux-3.10.0-862.el7.x86_64] (local build)
Copyright (C) 2002-16, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Health Status: OK

作者：椟夜
链接：https://www.jianshu.com/p/6020d4fbcde2
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
