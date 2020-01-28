
[查看Ubuntu内核版本和发行版本](https://www.jianshu.com/p/bda22f6db7a8)


# 内核版本
1. 终端运行命令：
xxx@xxx:~$ uname -r
4.4.0-63-generic
内核信息

2. 终端运行：
xxx@xxx:~$ uname -a
Linux xxxxx(主机名) 4.4.0-63-generic #84-Ubuntu SMP Wed Feb 1 17:20:32 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

# 发行版本

1. 终端运行：
xxx@xxx:~$ sudo lsb_release -a  
LSB Version:    core-9.20160110ubuntu0.2-amd64:core-9.20160110ubuntu0.2-noarch:security-9.20160110ubuntu0.2-amd64:security-9.20160110ubuntu0.2-noarch 
Distributor ID: Ubuntu  
Description:    Ubuntu 16.04.2 LTS  
Release:    16.04  
Codename:   xenial  

2. 或者运行：  
xxx@xxx:~$ cat /etc/issue  
Ubuntu 16.04.2 LTS \n \l  

作者：Cursor_fei
链接：https://www.jianshu.com/p/bda22f6db7a8
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
