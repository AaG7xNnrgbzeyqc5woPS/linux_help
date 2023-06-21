# 0. See:
- [如何在 Ubuntu 20.04 启用 SSH](https://zhuanlan.zhihu.com/p/145763789)
- [How to Enable SSH on Ubuntu 20.04](https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-20-04/)

# 1. 在 Ubuntu 上启用 SSH

默认情况下，当 Ubuntu 最初被安装的时候，通过 SSH 进行远程访问是不被允许的。在 Ubuntu 上启用 SSH 非常的简单直接。

以 root 或者其他 sudo 用户身份执行下面的步骤，在你的 Ubuntu 系统上安装并且启用 SSH。

## 1.1. 使用Ctrl+Alt+T打开终端，并且安装openssh-server软件包：

```
sudo apt update
sudo apt install openssh-server
```
当被提示时，输入你的密码并且按 Enter，继续安装。

## 1.2. 一旦安装完成，SSH 服务将会被自动启动。你可以验证 SSH 是否正在运行，输入：
```
sudo systemctl status ssh
```
输出将会告诉你服务正在运行，并且启用开机启动：
```
ssh.service - OpenBSD Secure Shell server
    Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
    Active: active (running) since Mon 2020-06-01 12:34:00 CEST; 9h ago
...
```
## 1.3. Ubuntu 自带一个配置防火墙配置工具，称为 UFW。如果防火墙在你的系统上被启用，请确保打开了 SSH 端口：
```
sudo ufw allow ssh
```
就这些。现在你可以从任何远程机器上通过 SSH 连接到你的 Ubuntu 系统。Linux 和 macOS 系统默认都安装了 SSH 客户端。想要从一个 Window 机器上连接，使用一个 SSH 客户端，例如:PUTTY。
