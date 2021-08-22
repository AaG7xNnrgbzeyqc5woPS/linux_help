# 0. See:
  - [https://nixos.org/](https://nixos.org/)
  - [Setup a development environment](https://nixos.org/guides/dev-environment.html)

# 1. Setup a development environment
-  依据教程 [Setup a development environment](https://nixos.org/guides/dev-environment.html)学习
-  登录 virtual box 中的nixos虚拟机，用demo/demo登录
-  
## 1.1 在/home/demo目录下，按照教程的要求建立三个文件
-  default.nix
-  myapp.py
-  setup.py 
## 1.2 在同一目录下，执行命令：
-  nix-build

## 1.3 查看生成的文件和链接
-  查看 建立的文件： 大概这样，/nix/store/6i4l781jwk5vbia8as32637207kgkllj-myapp-0.1
-  查看链接 ： result
```
#使用下面的命令可能更方便
ls -l /nix/store | grep myapp
ls -l /nin/store/*myapp*
# 查看本目录下的文件，最后建立的result文件在最上面
ls -lt    
# 可能用到的其它几个命令：
# pwd
# whoami
```  
## 1.4 
