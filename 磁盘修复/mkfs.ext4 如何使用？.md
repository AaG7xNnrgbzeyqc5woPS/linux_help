<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# mkfs.ext4 如何使用？

mkfs.ext4 是 Linux 系统中用于在磁盘分区上创建 ext4 文件系统的命令，其基本作用是格式化指定的磁盘设备，使其成为 ext4 格式的文件系统[^1][^5]。

## 基本用法

```bash
mkfs.ext4 [参数] 设备名
```

例如，对分区 `/dev/sdb1` 进行 ext4 格式化：

```bash
sudo mkfs.ext4 /dev/sdb1
```


## 常用参数说明

- `-b`：设置文件系统的数据块大小，单位为字节，常见值有1024、2048、4096等。
- `-c`：格式化前检查分区是否有坏块。
- `-E`：设置文件系统扩展选项，如启用 discard 支持 SSD 的 TRIM 功能。
- `-L`：设置文件系统卷标。
- `-m`：设置为管理员保留的文件系统块的百分比，默认是5%。
- `-F`：强制格式化，即使设备看起来已经被挂载或使用。
- `-q`：静默模式，不显示详细信息。

例如，格式化并设置卷标：

```bash
sudo mkfs.ext4 -L MyLabel /dev/sdb1
```

格式化时检查坏块：

```bash
sudo mkfs.ext4 -c /dev/sdb1
```

启用 discard 支持：

```bash
sudo mkfs.ext4 -E discard /dev/sdb1
```


## 使用注意事项

- 格式化前请确保目标分区未被挂载，否则可能导致数据损坏。
- 格式化会清除分区上的所有数据，务必提前备份重要数据。
- 确认设备名正确，避免误格式化其他设备。
- 如果系统提示找不到命令，可能需要安装 `e2fsprogs` 软件包（不同发行版安装命令不同，如 Ubuntu 使用 `sudo apt-get install e2fsprogs`）[^5]。

综上，mkfs.ext4 是创建 ext4 文件系统的标准工具，灵活使用其参数可以满足不同的格式化需求[^1][^4][^5]。

<div style="text-align: center">⁂</div>

[^1]: https://www.linuxcool.com/mkfs-ext4

[^2]: https://www.cnblogs.com/tssc/p/18422912

[^3]: https://docs.redhat.com/zh-cn/documentation/red_hat_enterprise_linux/8/html/managing_file_systems/creating-an-ext4-file-system_getting-started-with-an-ext4-file-system

[^4]: https://blog.csdn.net/TSZ0000/article/details/85719204

[^5]: https://bashcommandnotfound.cn/article/linux-mkfs.ext4-command

[^6]: https://blog.csdn.net/hochoy/article/details/80751839

[^7]: http://linux.51yip.com/search/mkfs.ext4

[^8]: https://www.cnblogs.com/micmouse521/p/8064568.html

