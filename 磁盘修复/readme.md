# See:
- [Linux 磁盘低级格式化操作指南及命令行详细解读](https://my.oschina.net/emacs_8754735/blog/17185164)
- [如何安全高效地在 Linux 环境下执行磁盘低级格式化操作](https://my.oschina.net/emacs_8754731/blog/17185151)
- [linux 低级格式化硬盘](https://cloud.tencent.com/developer/information/linux%20%E4%BD%8E%E7%BA%A7%E6%A0%BC%E5%BC%8F%E5%8C%96%E7%A1%AC%E7%9B%98)
- [Linux检测磁盘坏道 ](https://owenyk.github.io/2021/11/26/Linux%E6%A3%80%E6%B5%8B%E7%A3%81%E7%9B%98%E5%9D%8F%E9%81%93/#comment-waline)
- [linux修复磁盘坏道(本教程完全来自实例、实测，具体参数请根据个人情况修改)](https://zhuanlan.zhihu.com/p/417098586)
- [Linux硬盘的检测--smartctl详细介绍](https://www.cnblogs.com/fiberhome/p/8275961.html)
  
# 常用磁盘坏道检测工具
## 1. fsck 命令
- fsck（File System Check）是 Linux 中最常用的磁盘检查和修复工具。它可以检查并修复 ext2、ext3、ext4 等文件系统。
```
fsck /dev/sdxN
```
其中 /dev/sdxN 是需要检查的分区设备文件名。在使用 fsck 命令时，通常需要先卸载文件系统，或者在系统启动时自动运行。

以下是一些 fsck 命令的选项：
```
    -t：指定文件系统类型
    -f：强制检查，即使文件系统似乎没有错误
    -a：自动修复错误
    -n：不修复，只报告
```
例如，强制检查并尝试修复 /dev/sda1 分区：
```
fsck -t ext4 -f -a /dev/sda1
```

## 2. badblocks 命令

badblocks 用于检测磁盘上的坏块。在格式化或修复磁盘之前运行此命令是一个好习惯，以确保磁盘的健康。
```
badblocks -b 4096 -c 8192 /dev/sdx
```
其中 -b 指定块大小，-c 指定检查的块数量。

## 3. smartctl 命令

smartctl 是一个用于检查磁盘 SMART（自我监控、分析和报告技术）状态的工具。它可以帮助用户了解磁盘的健康状况和预测潜在故障。
```
smartctl -a /dev/sdx
```
使用这些工具，可以确保磁盘的健康并延长其使用寿命。然而，需要注意的是，在运行磁盘检查和修复命令时，务必小心，因为错误的操作可能会导致数据丢失。在执行任何操作之前，建议备份重要数据。

## dd 低级格式化
Linux中的低级格式化（Low-Level Formatting，LLF）是指对硬盘进行物理层面的初始化操作，它涉及到磁盘表面的划分，创建磁道和扇区，但不包括文件系统的创建。低级格式化通常是在硬盘出厂前由制造商完成的，但在某些情况下，用户可能需要对硬盘进行低级格式化，比如硬盘出现物理损坏或者需要彻底清除数据。

如果你需要在Linux中进行低级格式化，可以使用dd命令或者特定的工具如fdisk、mkfs等。以下是一个使用dd命令进行低级格式化的示例：
```
sudo dd if=/dev/zero of=/dev/sdX bs=512 count=1 conv=fdatasync
```
在这个命令中，/dev/sdX代表你要格式化的硬盘设备（例如/dev/sda），if=/dev/zero表示输入文件为零字节流，bs=512设置块大小为512字节，count=1表示只写入一个块，conv=fdatasync确保数据同步到磁盘。

- 注意：在执行低级格式化之前，请确保你已经备份了所有重要数据，因为这个过程是不可逆的，并且会导致硬盘上的所有数据丢失。
- 在执行这类操作之前，建议详细了解硬盘的状态和操作的风险，并在必要时寻求专业人士的帮助。
