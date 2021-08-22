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
## 1.4 进入环境启动应用
```
[demo@nixos:~]$ nix-shell default.nix
[nix-shell:~]$ python3 myapp.py

```
浏览器中输入: http://127.0.0.1：5000
可以看到浏览器有输出：Hello, Nix!
❤️成功！

## 1.5 总结：
- 虽然不明白几个文件的内容，照着教程做就可以，文件内容直接拷贝进去就行
- ❤️关键三个文件和执行命令nix-build在同一个目录下
- 执行中出现 WARNING错误不要理会，免得浪费时间
- 使用官方 nixos的ova文件（nixos-21.05.2518.97c5d0cbe76-x86_64-linux.ova）建立virtual box虚拟机,方便！
- 使用以几个命令：
```
ls -l /nix/store | grep myapp
ls -lt
pwd
whoami
```
 
