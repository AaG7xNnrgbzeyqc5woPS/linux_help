# 0. See:
   - [设置Ubuntu Server 18.04自动更新](https://www.tongfu.info/ubuntu-automatic-updates/)
   - [Ubuntu Server 系统实现自动更新](https://www.linuxidc.com/Linux/2019-08/160242.htm)
   - ❤️[Ubuntu服务器怎么设置每天自动进行安全更新?](https://www.jb51.net/os/Ubuntu/451927.html)
   - [如何在Ubuntu服务器上使安全更新每天自动进行](https://jingyan.baidu.com/article/414eccf644e6bb6b431f0a93.html)
   - [Ubuntu系统怎么手动进行更新升级?](https://www.jb51.net/os/Ubuntu/397838.html)

# 1. 简单的方法
```
sudo apt install  unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades 
```
     
# 2. 命令行手动更新
1. 按 Ctrl＋alt＋t，打开终端，输入：$ sudo apt-get update，用于检查当前的源服务器上，是否有可用的更新。
2. 接着执行：$ sudo apt-get upgrade，用于对当前已经安装的包进行升级。
3. 上述命令如果出现不成功的提示，有可能是因为软件包之间的依赖关系导致的问题。这时，可以用以下命令代替：$ sudo apt-get dist-upgrade

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade
```
