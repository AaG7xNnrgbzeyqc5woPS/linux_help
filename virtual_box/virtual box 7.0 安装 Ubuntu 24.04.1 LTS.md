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

# 一、主要问题：
- 安装附件后，不能自动扩展屏幕，更改分辨率， 并且经常会在屏幕扩展操作的时候死机。
- 这会导致很大的问题，几乎无法使用，并且附件安装不能成功，也会导致性能大幅度下降

# 二、分析1 ：
- **首先想到的是附件（Linux Guest Additions）安装不正确。**

**以下是需要注意的地方：**
1，更新软件源，找国内最快的，使用的软件“Softeware and updates”

2，命令行中升级软件的命令：
```
  sudo apt update
  sudo apt upgrade
```

3，安装附件Linux Guest Additions的命令：
- [Installing the Linux Guest Additions](https://www.virtualbox.org/manual/topics/guestadditions.html#additions-linux-install)
```
./VBoxLinuxAdditions.run  //这个命令也可以安装，使用 sudo ./VBoxLinuxAdditions.run 反而会安装失败
sh ./VBoxLinuxAdditions.run  // 这个是官方文档中推荐的方法
```
4，如果命令运行失败，按照提示信息，安装需要的依赖包

5，另外补充几个可能需要的包
```
sudo apt update
sudo apt install bzip2 tar gdebi
```
6, 如果遇到任何依赖问题，执行以下命令修复:
```
sudo apt-get install -f
```

7, Linux 安装 Chrome浏览器
```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

# 三、 分析二：
经过前面的研究和尝试，似乎附件已经安装成功了，为什么还是不能正常使用呢？是不是软件有bug?又去网上找教程，找到两个教程，在上面的资料中提到。

根据教程，认真对比，发现几个关键点：  
- 1，虚拟机的配置中，系统\芯片组 改成缺省“PIIX3”
- 2, \显示\屏幕\显存大小 修改成最大 128M
- 3，虚拟显卡还是 使用 VMSVGA
- 4, USB关闭，现在也用不着
- 5，\用户界面\小工具栏，全部不选择，任何情况下都不显示小工具栏。

💝 经过上面的修改，再启动虚拟机后，附件正常工作，显示可以自动扩展。

OK!   
Good job!  
