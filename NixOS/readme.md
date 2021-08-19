# 0. See:
- [维基百科 NixOS](https://en.wikipedia.org/wiki/NixOS)
- [NixOS official web](https://nixos.org/)
- [NixOS distro](https://distrowatch.com/table.php?distribution=nixos)
- [NixOS Manual](https://nixos.org/manual/nixos/stable/index.html#preface)
- [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide#Making_the_installation_media)


# 0. 前言
  原先在使用manjaro，相当的不错，但是有两个烦恼：
  首先是系统会升级崩溃，或者系统的一致性被破坏，升级被卡住。大概半年到一年就发生一次，需要重装系统，复杂的配置。无法保证绝对的稳定，不能满足我的需要。
  第二，系统用着用着，会膨胀，各种软件装的太多，也不好卸载，怕崩溃。系统重装的配置复杂，都是手工操作，无法自动化，配置人工记住不，自然也无法重现。
  这两个烦恼导致我一直在寻找新的，好用的发布版本。无意中看到 NixOS，相见恨晚，以前怎么没有发现呢？！


# 2. NixOS 简介
   **Reproducible builds and deployments. #可重现的构造和部署**
   Nix is a tool that takes a unique approach to package management and system configuration. Learn how to make reproducible, declarative and reliable systems. 
   
## 1.1. Reproducible
Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so **if a package works on one machine, it will also work on another. **
    
## 1.2. Declarative # 基于声明式的配置
  Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you’re using.
  
## 1.3 Reliable
Nix ensures that installing or upgrading one package cannot break other packages. It allows you to roll back to previous versions, and ensures that no package is in an inconsistent state during an upgrade. 

## 1.4 其它特性
  上面三个特性是官网上总结的，要深入理解，要多角度认识 NixOS

## 1.4 总结：
 NixOS 是一个GNU/linux发布版本，该项目专注系统配置研发，是一个试验项目，但是当前已经可以使用，缺省已经带有桌面系统。安装还需要手工处理，所以不建议linux新手使用。
 NixOS 拥有一个80000个包的包管理系统Nixpkgs。The Nix Packages collection (Nixpkgs) is a set of over 80 000 packages for the Nix package manager. 
 最看中NixOS的可靠性，以及简单的 可重现式部署。
 
