# see:
- [Ubuntu24.04更换源地址（新版源更换方式）](https://www.imlhx.com/posts/7930.html)
- [中科大Ubuntu 软件源](https://mirrors.ustc.edu.cn/help/ubuntu.html#__tabbed_1_1)

# 1. Ubuntu24.04更换源地址（新版源更换方式）

Ubuntu24.04的源地址配置文件发生改变，不再使用以前的sources.list文件，升级24.04之后，该文件内容变成了一行注释：
```
# Ubuntu sources have moved to /etc/apt/sources.list.d/ubuntu.sources
```
新的官方源配置放在了/etc/apt/sources.list.d/ubuntu.sources中，升级前的三方源被放在了/etc/apt/sources.list.d/third-party.sources中。

首先修改sources.list.d/ubuntu.sources，添加Enabled: no进行禁用：
```
Enabled: no
Types: deb
URIs: http://archive.ubuntu.com/ubuntu
Suites: noble noble-updates
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

Enabled: no
Types: deb
URIs: http://security.ubuntu.com/ubuntu
Suites: noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```
修改sources.list.d/third-party.sources文件，填入国内源地址：
清华源
```
Enabled: yes
Types: deb
URIs: http://mirrors.tuna.tsinghua.edu.cn/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```
中科大源
```
Enabled: yes
Types: deb
URIs: http://mirrors.ustc.edu.cn/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```
阿里源
```
Enabled: yes
Types: deb
URIs: http://mirrors.aliyun.com/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```
网易源
```
Enabled: yes
Types: deb
URIs: http://mirrors.163.com/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```
腾讯源
```
Enabled: yes
Types: deb
URIs: http://mirrors.tencent.com/ubuntu/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```

# 2. 测试：
- 在 24.04 LTSB版本中，/etc/apt/sources.list 文件中，并非空，还是原来的老格式（One-Line-Style 格式），而且有效。看来是改进了，老格式也兼容了。
- 为了使用新格式，请注释/etc/apt/sources.list全部行，并且最开头 加上注释 ```# Ubuntu sources have moved to /etc/apt/sources.list.d/ubuntu.sources```
- /etc/apt/sources.list.d/ubuntu.sources中，/etc/apt/sources.list.d/third-party.sources，这两个文件不存在，请创建！
- 其它按照上面的教程进行操作就可以啦
- 最后使用下面两个命令，升级系统，试验成功！
  ```
  # apt update
  # apt full-upgrade -y
  ```

# 3. 新知识：什么是 DEB822 (.sources) 文件格式？
自新版本的 Debian 与 Ubuntu 起，例如：
```
    Debian 12 的容器镜像
    Ubuntu 24.04
```
默认预装的系统中 APT 的系统源配置文件不再是传统的 /etc/apt/sources.list。传统格式（又被称为 One-Line-Style 格式）类似如下：
```
deb http://mirrors.ustc.edu.cn/debian/ bookworm main contrib
```
新的 DEB822 格式自 APT 1.1（2015 年发布）起支持，后缀为 .sources，存储在 /etc/apt/sources.list.d/ 目录下，格式类似如下：
```
Types: deb
URIs: https://mirrors.ustc.edu.cn/debian
Suites: bookworm
Components: main contrib
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```
在切换软件源时，需要根据实际情况选择对应的格式进行修改。

关于 DEB822 格式的设计考虑，可以参考官方文档（英文）。
