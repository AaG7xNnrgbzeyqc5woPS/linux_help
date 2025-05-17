# see:
- [Ubuntu24.04更换源地址（新版源更换方式）](https://www.imlhx.com/posts/7930.html)
- [中科大Ubuntu 软件源](https://mirrors.ustc.edu.cn/help/ubuntu.html#__tabbed_1_1)

# Ubuntu24.04更换源地址（新版源更换方式）

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
