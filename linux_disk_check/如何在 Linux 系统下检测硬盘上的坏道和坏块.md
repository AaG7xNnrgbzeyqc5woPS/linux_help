
 [如何在 Linux 系统下检测硬盘上的坏道和坏块](https://www.linuxprobe.com/check-linux-disk.html)
 
 lsblk
 ls /dev/sdc
 sudo fdisk -l
 然后用如下命令检查你的 Linux 硬盘上的坏道/坏块：
$ sudo badblocks -v /dev/sda10 > badsectors.txt

上面的命令中，badblocks 扫描设备/dev/sda10（记得指定你的实际设备），-v选项让它显示操作的详情。另外，这里使用了输出重定向将操作结果重定向到了文件badsectors.txt。

如果你在你的磁盘上发现任何坏道，卸载磁盘并像下面这样让系统不要将数据写入回报的扇区中。

你需要执行e2fsck（针对 ext2/ext3/ext4 文件系统）或fsck命令，命令中还需要用到badsectors.txt文件和设备文件。

-l 选项告诉命令将在指定的文件 badsectors.txt 中列出的扇区号码加入坏块列表。

------------ 针对 for ext2/ext3/ext4 文件系统 ------------
$ sudo e2fsck -l badsectors.txt /dev/sda10
或
------------ 针对其它文件系统 ------------
$ sudo fsck -l badsectors.txt /dev/sda10


在 Linux 上使用 Smartmontools 工具扫描坏道

这个方法对带有 S.M.A.R.T（自我监控分析报告技术）系统的现代磁盘（ATA/SATA 和 SCSI/SAS 硬盘以及固态硬盘）更加的可靠和高效。S.M.A.R.T 系统能够帮助检测，报告，以及可能记录它们的健康状况，这样你就可以找出任何可能出现的硬件失效。
你可以使用以下命令安装smartmontools：

------------ 在基于 Debian/Ubuntu 的系统上 ------------
$ sudo apt-get install smartmontools
------------ 在基于 RHEL/CentOS 的系统上 ------------
$ sudo yum install smartmontools

安装完成之后，使用 smartctl 控制磁盘集成的 S.M.A.R.T 系统。你可以这样查看它的手册或帮助：

$ man smartctl
$ smartctl -h

然后执行 smartctrl 命令并在命令中指定你的设备作为参数，以下命令包含了参数 -H 或 --health 以显示 SMART 整体健康自我评估测试结果。

$ sudo smartctl -H /dev/sda10

如何在 Linux 系统下检测硬盘上的坏道和坏块如何在 Linux 系统下检测硬盘上的坏道和坏块
检查 Linux 硬盘健康

上面的结果指出你的硬盘很健康，近期内不大可能发生硬件失效。

要获取磁盘信息总览，使用 -a 或 --all 选项来显示关于磁盘所有的 SMART 信息， -x 或 --xall 来显示所有关于磁盘的 SMART 信息以及非 SMART 信息。

在这个教程中，我们涉及了有关磁盘健康诊断的重要话题，希望能够帮助你。

原文来自：https://linux.cn/article-7961-1.html
