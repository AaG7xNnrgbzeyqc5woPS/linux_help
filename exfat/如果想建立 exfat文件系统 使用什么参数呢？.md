<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 如果想建立 exfat文件系统 使用什么参数呢？

在Linux系统中，如果想建立exFAT文件系统，通常使用`mkfs.exfat`命令（这是`mkfs`命令的专用版本），具体用法如下：

```bash
sudo mkfs.exfat [选项] 设备路径
```


### 常用参数说明

- `-n <volume-name>`：设置卷标（卷名称），最多支持15个字符。
- `-i <volume-id>`：设置卷ID，为32位十六进制数，默认基于当前时间自动生成。
- `-p <partition-first-sector>`：分区起始扇区，通常为0，默认即可。
- `-s <sectors-per-cluster>`：每簇扇区数，必须是2的幂，如1、2、4、8等。簇大小不能超过32MB。默认根据卷大小自动选择：
    - 小于256MB时簇大小4KB
    - 256MB到32GB时簇大小32KB
    - 大于32GB时簇大小128KB
- `-v`：显示版本信息。


### 示例命令

格式化设备 `/dev/sdb1`，卷标为 `exfat`，簇大小为128扇区：

```bash
sudo mkexfatfs -n exfat -s 128 /dev/sdb1
```

或者使用`mkfs.exfat`（两者功能类似）：

```bash
sudo mkfs.exfat -n exfat /dev/sdb1
```

如果不指定参数，命令会使用默认设置自动完成格式化：

```bash
sudo mkfs.exfat /dev/sdb1
```


### 额外说明

- 格式化前请确保设备路径正确，且设备未挂载。
- 格式化会清除设备上所有数据，请提前备份。
- 需要先安装exFAT工具包，如Debian/Ubuntu系统执行：

```bash
sudo apt-get install exfat-utils
```

- 格式化完成后，可以用如下命令挂载：

```bash
sudo mount -t exfat /dev/sdb1 /mnt/exfat
```

综上，建立exFAT文件系统时，使用`mkfs.exfat`命令，常用参数是`-n`设置卷标，`-s`设置簇大小，示例如下：

```bash
sudo mkfs.exfat -n MyVolume -s 128 /dev/sdb1
```

这将格式化`/dev/sdb1`为exFAT文件系统，卷标为“MyVolume”，簇大小为128扇区[^1][^3][^5]。

<div style="text-align: center">⁂</div>

[^1]: https://blog.csdn.net/Luckiers/article/details/117426571

[^2]: https://blog.csdn.net/Pipcie/article/details/104964788

[^3]: https://worktile.com/kb/ask/425259.html

[^4]: https://docs.redhat.com/zh-cn/documentation/red_hat_enterprise_linux/9/html/considerations_in_adopting_rhel_9/assembly_file-systems-and-storage_considerations-in-adopting-rhel-9

[^5]: https://worktile.com/kb/ask/423265.html

[^6]: https://13s.fun/134.html

[^7]: https://wiki.archlinuxcn.org/wiki/文件系统

[^8]: https://github.com/exfatprogs/exfatprogs

[^9]: https://developer.aliyun.com/article/518316

