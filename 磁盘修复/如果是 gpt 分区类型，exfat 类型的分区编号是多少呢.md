<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 如果是 gpt 分区类型，exfat 类型的分区编号是多少呢

在 GPT 分区表中，exFAT 分区对应的分区类型 GUID 是：

**EBD0A0A2-B9E5-4433-87C0-68B6B72699C7**

这个 GUID 是 GPT 中用于标识“基本数据分区”（Basic Data Partition）的标准类型，Windows 系统中 exFAT、NTFS 以及 FAT32 等文件系统都使用这个类型标识[^3][^6]。

具体说明：

- GPT 分区不像 MBR 那样用单字节的分区类型 ID，而是用一个 128 位的 GUID 来标识分区类型。
- exFAT 文件系统在 GPT 分区中没有单独专用的 GUID，而是与 NTFS、FAT32 等共享同一个“基本数据分区”GUID，即 EBD0A0A2-B9E5-4433-87C0-68B6B72699C7。
- 这个 GUID 表示该分区是一个通用的数据分区，文件系统类型由分区内具体格式决定。
- 在 Windows 和 Linux 等系统中，识别 exFAT 分区时，会结合 GPT 分区的这个 GUID 和分区内的文件系统结构来判断。

总结：


| 分区格式 | exFAT 分区编号（标识） | 说明 |
| :-- | :-- | :-- |
| MBR | 7 | HPFS/NTFS/exFAT 类型 |
| GPT | EBD0A0A2-B9E5-4433-87C0-68B6B72699C7 | 基本数据分区 GUID，含 exFAT |

因此，在 Linux 的 fdisk 或其他 GPT 分区工具中，exFAT 分区的类型编号就是上述的 GPT 基本数据分区 GUID[^3][^6]。

<div style="text-align: center">⁂</div>

[^1]: https://blog.csdn.net/q1w21_2/article/details/79248095

[^2]: https://www.cnblogs.com/liwen01/p/18214817

[^3]: https://learn.microsoft.com/zh-cn/windows/win32/fileio/exfat-specification

[^4]: https://www.ruanyifeng.com/blog/2018/10/exfat.html

[^5]: http://www.360doc.com/content/22/1122/17/277688_1057091743.shtml

[^6]: https://zh.wikipedia.org/zh-cn/ExFAT

[^7]: https://zh.opensuse.org/SDB:分区

[^8]: https://blog.csdn.net/choumin/article/details/110862544

[^9]: https://zh.wikipedia.org/zh-cn/分区类型

[^10]: https://www.jinbuguo.com/storage/gpt.html

