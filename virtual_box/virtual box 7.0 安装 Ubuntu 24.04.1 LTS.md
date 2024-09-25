# See1 教程:
- [guestadditions](https://www.virtualbox.org/manual/topics/guestadditions.html#additions-linux-install) 
- [新版VirtualBox安装Ubuntu 24.04，超详细教学！安装增强功能，虚拟机安装linux教程](https://www.youtube.com/watch?v=Lv2d8SV5nnU)
- [VirtualBox 安装Ubuntu 24.04，下载安装教学，virtualbox安装linux系统教程](https://www.kjfx.cc/537.html)
- [HOW TO INSTALL UBUNTU 24.04 LTS ON VIRTUALBOX](https://www.youtube.com/watch?v=kYyrgofgWGQ)

# See2 资源:
- [Canonical ubuntu](https://ubuntu.com/)
- [Download Ubuntu Desktop](https://ubuntu.com/download/desktop)
- [virtualbox](https://www.virtualbox.org/)
- [virtualbox manual](https://www.virtualbox.org/manual/)
- [Introduction to Guest Additions](https://www.virtualbox.org/manual/topics/guestadditions.html#guestadd-intro)
- [Installing the Linux Guest Additions](https://www.virtualbox.org/manual/topics/guestadditions.html#additions-linux-install)

# 主要问题：
- 安装附件后，并不能自动扩展屏幕，并且经常会在屏幕扩展操作的时候死机。

# 分析1：
- 首先想到的是附件（Linux Guest Additions）安装不正确。
- 以下是需要主要的地方：
- 1，更新软件源，找国内最快的，使用的软件“Softeware and updates”
- 2，命令行中升级软件的命令：
```
  sudo apt update
  sudo apt upgrade
```
- 3，安装附件Linux Guest Additions的命令：
- [Installing the Linux Guest Additions](https://www.virtualbox.org/manual/topics/guestadditions.html#additions-linux-install)
```
./VBoxLinuxAdditions.run  //这个命令也可以安装，使用 sudo ./VBoxLinuxAdditions.run 反而会安装失败
sh ./VBoxLinuxAdditions.run  // 这个是官方文档中推荐的方法
```

