<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Windows 11 Consumer 24H2 如何离线安装？跳过微软网络账号

Windows 11 24H2 版本离线安装并跳过微软网络账号登录，可以通过以下几种主要方法实现：

## 1. 使用 Rufus 制作安装U盘，直接跳过微软账户登录

- 下载 Windows 11 24H2 官方镜像（约5.42GB）。
- 使用 Rufus 制作启动U盘时，选择镜像后，在弹出选项中勾选“移除对登录微软账户的要求”。
- 制作完成后，用此U盘启动安装，安装过程中可以直接创建本地账户，无需联网和微软账户登录[^1][^3]。


## 2. 安装过程中通过命令行跳过联网和微软账户

- 在安装Windows 11时，遇到联网界面时，按下快捷键 `Shift + F10`（部分笔记本需按 `Fn + Shift + F10`）打开命令提示符窗口。
- 输入命令：

```
start ms-cxh:localonly
```

- 这样可以跳过联网要求，进入创建本地账户的界面，用户名和密码可以不填，直接跳过[^2][^3]。


## 3. 修改注册表跳过联网和微软账户登录

- 在联网界面按 `Shift + F10` 打开命令提示符，输入 `regedit` 打开注册表编辑器。
- 导航至：

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE
```

- 右侧空白处新建一个 DWORD (32位) 值，命名为 `BypassNRO`，数值设为 `1`。
- 关闭注册表，回到命令提示符，输入：

```
shutdown /r /t 0
```

- 重启后选择“我没有Internet连接”，即可跳过联网和微软账户登录[^2][^4][^5]。


## 4. 使用U盘脚本自动跳过联网

- 在U盘中准备一个名为 `win11跳过联网.cmd` 的脚本，内容如下：

```
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE /v BypassNRO /t REG_DWORD /d 1 /f
shutdown /r /t 0
```

- 在联网界面按 `Shift + F10` 打开命令提示符，切换到U盘盘符（如 `E:`），执行：

```
start win11跳过联网.cmd
```

- 系统重启后即可跳过联网登录[^4]。

---

综上，Windows 11 24H2 离线安装并跳过微软网络账号登录的推荐方法是：

- 使用 Rufus 制作启动盘时勾选跳过微软账户选项，或
- 安装过程中用 `Shift + F10` 调出命令行执行 `start ms-cxh:localonly`，或
- 修改注册表添加 `BypassNRO` 键值后重启跳过联网。

这些方法均可实现无需联网和微软账户即可完成Windows 11 24H2的离线安装和本地账户登录[^1][^2][^3][^4][^5]。

<div style="text-align: center">⁂</div>

[^1]: https://blog.csdn.net/wuhanwhite/article/details/143001309

[^2]: https://www.wanjiachupin.com/300.html

[^3]: https://www.sysgeek.cn/install-windows-11-without-microsoft-account/

[^4]: https://blog.csdn.net/Victor68686868/article/details/147701602

[^5]: https://post.smzdm.com/p/an9onqo7

[^6]: https://iknow.lenovo.com.cn/detail/425183.html

[^7]: https://blog.csdn.net/2503_91657896/article/details/147471257

[^8]: https://www.laoliang.net/news/23362.html

[^9]: https://www.microsoft.com/zh-cn/software-download/windows11

[^10]: https://windiscover.com/posts/windows-11-24h2-with-april-2025-update-iso.html

