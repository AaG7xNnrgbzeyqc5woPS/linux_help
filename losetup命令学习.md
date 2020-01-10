See:
    linux命令学习笔记——losetup命令：设置循环设备
    https://www.cnblogs.com/wangyongbin/p/4374230.html
    
    使用dump和restore来制作树莓派的img镜像
    http://www.tyrantek.com/archives/508/
    
----------------------------
# 练习一: 
 挂载单分区image 
----------------------------

 1, 建立循环设备
sudo losetup --show -f oz_mount.img
// -f找第一个未使用的loop设备
//--show显示挂载后的 loop设备
//--show   print device name after setup (with -f)
//-v, --verbose                 verbose mode

 2. 显示设置的循环设备
$losetup /dev/loop0
/dev/loop0: []: (/home/john/mount_img/oz_mount.img)

 3. 显示所有的已经使用的循环设备的状态
$losetup -a
/dev/loop1: [2049]:1326070 (/home/john/mount_img/oz_mount.img)
/dev/loop0: [2049]:1326070 (/home/john/mount_img/oz_mount.img)

 4. 卸载循环设备
sudo losetup -d /dev/loop0  //卸载循环设备

 5. 查找第一个未使用的循环设备
$losetup -f
/dev/loop2

6. 格式化虚拟磁盘文件
mkfs.ext4 /dev/loop0

7. 挂载虚拟磁盘文件
mount /dev/loop0  /mnt/iso

8、可以复制文件到里面或删除（测试成功)

9、卸载文件系统
umount /mnt/iso
 
#  总结:
1. 先 建立img对应的循环设备 /dev/loopx  
  1.1 可以分区   
       fdisk /dev/loopx  
  1.2 可以格式化文件系统   
     mkfs.ext4 /dev/loop0  
2.  /dev/loopx挂载 到 文件系统 /mnt/iso  
3.  /mnt/iso文件系统读写操作  
4.  卸载 umount /mnt/iso  
5.  卸载循环设备 losetup -d /dev/loopx  
