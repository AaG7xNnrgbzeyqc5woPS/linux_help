# 0. See:
- [维基百科 NixOS](https://en.wikipedia.org/wiki/NixOS)
- [NixOS official web](https://nixos.org/)
- [NixOS distro](https://distrowatch.com/table.php?distribution=nixos)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/index.html#preface)
- [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide#Making_the_installation_media)
- [NixOS Learn](https://nixos.org/learn.html)
- [Nix 镜像使用帮助-TUNA](https://mirrors.tuna.tsinghua.edu.cn/help/nix/)
- [Nix os初体验（视频）](https://www.bilibili.com/video/BV1kt411v7fZ/)
- [独立发行版NixOS简单体验](https://www.bilibili.com/video/BV1nf4y1b7H7/?spm_id_from=333.788.recommend_more_video.2)


# 1. 前言
  原先在使用manjaro，相当的不错，但是有两个烦恼：
  首先是系统会升级崩溃，或者系统的一致性被破坏，升级被卡住。大概半年到一年就发生一次，需要重装系统，复杂的配置。无法保证绝对的稳定，不能满足我的需要。
  第二，系统用着用着，会膨胀，各种软件装的太多，也不好卸载，怕崩溃。系统重装的配置复杂，都是手工操作，无法自动化，配置人工记住不，自然也无法重现。
  这两个烦恼导致我一直在寻找新的，好用的发布版本。无意中看到 NixOS，相见恨晚，以前怎么没有发现呢？！


# 2. NixOS 简介
   **Reproducible builds and deployments. #可重现的构造和部署**
   Nix is a tool that takes a unique approach to package management and system configuration. Learn how to make reproducible, declarative and reliable systems. 
   
## 2.1. Reproducible
Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so **if a package works on one machine, it will also work on another. **
    
## 2.2. Declarative # 基于声明式的配置
  Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you’re using.
  
## 2.3 Reliable
Nix ensures that installing or upgrading one package cannot break other packages. It allows you to roll back to previous versions, and ensures that no package is in an inconsistent state during an upgrade. 

## 2.4 其它特性
  上面三个特性是官网上总结的，要深入理解，要多角度认识 NixOS。
  - 基于声明式（Declarative）的配置，统一的配置文件，内在的数学原理是基于函数式编程，也就是符合 幂等率，无内部状态，唯一的配置文件生成唯一的最终配置。生成的配置是只读的，新的安装不会覆盖原来的安装，包文件都是用包的hash值命名的，这样的机制还能支持多版本程序库同时运行和共存，
  - 上面的机制导致，软件在各种粒度上都是只读的唯一的可配置的可管理的，从系统硬件配置，内核到软件包，再到应用程序的，开发环境的配置。
  - 为了配置文件的编写，专用开发一种编程语言: nix, nix可以在任何linux上使用，不仅仅是在nixOS上
  - 这中机制的缺点是多版本的软件包会占用硬盘空间，系统重来不会自动清除无用的软件包，需要用户自己清除垃圾。
  - NixOS是基于Nix软件包管理器构建的Linux发行版。它使用声明性配置，并允许进行可靠的系统升级。
  - 基于源码编译型发布版本，类似于Arch,Gentoo,所以高度可配置，可以更改编译选项，编译自己专用的版本
  - 编译包有专用的cache, 如果hash值匹配，直接下载编译后的软件，不用在本机编译，可以节省不少时间。
  

## 2.5 总结：
 NixOS 是一个GNU/linux发布版本，该项目专注系统配置研发，是一个试验项目，但是当前已经可以使用，缺省已经带有桌面系统。目前安装还需要手工处理，所以不建议linux新手使用。
 NixOS 拥有一个80000个包的包管理系统Nixpkgs。The Nix Packages collection (Nixpkgs) is a set of over 80 000 packages for the Nix package manager.   
 **最看中NixOS的可靠性，以及简单的可重现式部署**。
 
 
# 3. 在virtual box中安装 NixOS
在虚拟机virtual box中有两种方式安装 NixOS,一种是用 虚拟机的 OVA format文件直接恢复虚拟机，这是最简单的方法，用于掠过安装过程，快速体验NixOS的使用   
还有一种就是ISO image文件，象安装物理机一样安装，侧重对物理机的安装过程的模拟和学习
    
## 3.1. 使用 OVA format文件

- [官方教程- nixos-virtualbox install official guaid](https://nixos.org/download.html#nixos-virtualbox)
- This is a demo appliance for VirtualBox (in OVA format). 
- VirtualBox image includes the Plasma Desktop (was KDE) as well as the VirtualBox guest additions.

```
    To use it

    Download the OVA file using the button above.
    Open VirtualBox.
    Run File → Import Appliance from the menu.
    Select previously downloaded OVA file.
    Click Import.
    You can then start the virtual machine.
    You can log in as user demo, password demo.
    To obtain a root shell, run sudo -i in the terminal (konsole).
```

安装过程非常顺利，验证能够登录系统，已经带有 VirtualBox guest additions，所以能同主系统(host)互动，特别是屏幕能够缩放，这样才能方便使用  
    
   
## 3.2 CD images install
  安装过程比较复杂，需要多次尝试。    
  第一次尝试，配置好后，在安装过程中，硬盘空间不够，安装失败，因为安装的时候需要编译。另外，网络不通，需要更改软件源到国内，直接下载cache，减少编译工作量，加快安装速度。  

### 3.2.1 分区parted知识:
  分区可以先分区硬盘后面的空间，这样就可以更好的控制分区的次序，安排不同的分区内容。帮助文件介绍的方法，学到了!
  ```
  /dev/sda1  根分区    位置在硬盘的中间
  /dev/sda2  swap分区  在硬盘的最后
  /dev/sda3  boot分区  在硬盘的开始扇区
  ```
  我习惯使用Fdisk分区，parted是命令行分区，难度大一些，更适合脚本使用  
  
### 3.2.2 修改分辨率
 - 启动盘（live cd）启动后设置屏幕分辨率： application/settings/display, 1920×1440(4:3),这样可以满屏，好操作多了
 - 最后发现最好的分辨率是：1580×1050，虽然两边还有空边。暂时可以用，也不会查host的分辨率，所以我屏幕的分辨率还不知道

### 3.2.3 nixos manual
 - 命令：nixos-help 启动本地的帮助系统，浏览器浏览

### 2.2.4 sudo -i 
     切换到 root用户
     
### 2.2.5 安装包 
  nix-env -iA nixpkgs.neofetch
  
### 2.2.6 命令行查看配置文件的选项
  man configuration.nix
  
### 2.2.7 nixos-rebuild 
  - 修改配置文件/etc/nixos/configuration.nix, 使用nixos-rebuild 重建系统的配置
  - 这个在命令在新的系统下，修改自身的配置用。不是使用 live CD 安装的时候用。
  - live CD 安装新系统，修改新系统的配置后，使用 nixos-install 命令更新配置

### 2.2.8 GPT 硬盘的启动
  - 安装好配置后，发生一些问题，新的GPT硬盘无法引导
  - 第一个办法：简化配置，用手册中的最简单例子
  - 最后想到是在virtual box中，需要UEFI systems的支持，硬件引导相应的GPT分区
  - 修改virutal box/set up/system/mother board/enabled EFI ,checked it
  - GPT启动Ok!
  
  
   
   
   
 
 
