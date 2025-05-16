# See：
- [badblocks命令 – 检查磁盘装置中损坏的区块](https://www.linuxcool.com/badblocks)
- [磁盘硬件问题(坏块)检测](https://github.com/digoal/blog/blob/master/201803/20180331_01.md)
- [磁盘管理（磁盘格式化，引导块和坏块）详解](http://c.biancheng.net/view/1291.html)
- [Linux 下检测磁盘坏道的方式](https://blog.csdn.net/u012611644/article/details/80843704)


# badblocks

badblocks就是一个检查磁盘装置中损坏区块的命令，执行该命令时只须指定所要检查的磁盘装置，及此装置的磁盘区块数。 

**语法格式：**
  badblocks [参数] 
  
**常用参数：**

-b 指定磁盘的区块大小，单位为字节 
-o 将检查的结果写入指定的输出文件 
-s 在检查时显示进度 
-v 执行时显示详细的信息 
-w 在检查时，执行写入测试 

**参考实例** 
-  通过命令扫描硬盘：
```
[root@linuxcool ~]# badblocks -s -v /dev/sdnx  
```
其中n表示硬盘设备名，x表示硬盘对应的分区号，例如需要检查”/dev/sda2″：  
```
[root@linuxcool ~]# badblocks -s -v /dev/sda2 
Checking blocks 0 to 30681000 Checking for bad blocks (read-only test): 
306809600674112/ 
306810000000 
30680964 
30680965 
30680966 
30680967 
30680968 
30680969 
30680970 
30680971 
30680972 
30680973 
... 
done Pass completed, 37 bad blocks found.
其中，“37 bad blocks found”表示硬盘存在37个坏块。
```
- 以4096字节为一个“block”,每一个“block”检查1次, 将结果输出到“hda-badblocks-list.1”文件中，
由第51000 block开始，到63000 block结束：
```
[root@linuxcool ~]# badblocks -b 4096 -c 1 /dev/hda1 -o hda-badblocks-list.1 63000 51000 
```

- 扫描硬盘的损坏扇区或区块并写入到临时文件夹下的bad-blocks.txt文件中： 
```
[root@linuxcool ~]# badblocks -v -o /dev/sdb > /tmp/bad-blocks.txt
```

- 如果找到了坏道，可以进行写入扫描进行修复。写入扫描遇到坏道的时候会自动重映射。写入扫描会覆盖原有数据，所以请先备份。写入扫描速度很低，所以应该只扫描只读扫描时候发现错误的部分： 
```
[root@linuxcool ~]# badblocks -w -s /dev/sdb END START
```
将END和START换成结束和开始的块的编号就可以了。

原文链接：https://www.linuxcool.com/badblocks
