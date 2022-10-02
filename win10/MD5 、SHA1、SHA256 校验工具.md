# See:
- [MD5 、SHA1、SHA256 校验工具 - windows](https://zhuanlan.zhihu.com/p/388383489)
- [Ubuntu系统中上查看MD5,SHA1](https://blog.csdn.net/qq_30552993/article/details/50487197)
- [Linux sha1sum初学者命令教程（带示例）](https://www.howtoing.com/linux-sha1sum-command)

# 单向哈希值计算
  
  SHA家族有五个算法：SHA-1、SHA-224、SHA-256、SHA-384，和SHA-512，后四种有时候称为SHA2
  MD5 已经被破解，不安全（密码学家可以伪造，称为碰撞），不推荐使用。
  crc32循环校验码，用于校验文件是否被破环，也是类似。当然这个就没有安全性，故意伪造很容易。
  
  # 方法一：计算sha1并且显示在屏幕，人工比较
  - ❤️sha1sum ubuntu-20.10-desktop-amd64.iso
  - sha1sum 文件名
  ```
john@john-TM1613:~/depot/ISO$ LS
LS：未找到命令
john@john-TM1613:~/depot/ISO$ LS
LS：未找到命令
john@john-TM1613:~/depot/ISO$ ls
RADS11_delphi11                 ubuntu-22.04.1-desktop-amd64.iso        Zorin-OS-16.1-Core-64-bit.iso
RADS11_delphi11.zip             virtualbox-6.1_6.1.38_ubuntu_22.04_x64
ubuntu-20.10-desktop-amd64.iso  winxp_prof.iso
john@john-TM1613:~/depot/ISO$ sha1sum ubuntu-20.10-desktop-amd64.iso 
5463898b5fdf07d446bcf06ee86815033fce5e3a  ubuntu-20.10-desktop-amd64.iso
john@john-TM1613:~/depot/ISO$ 
 

```

# 方法二：使用文件校验，自动计算，自动比较校验值
- 使用nano编辑一个文件，带校验值和文件名。比如下例子里面的 check.txt文件
-  check.txt文件可以有多行，一次校验多个iso文件
-  使用命令： sha1sum -c check.txt 开始校验，校验正确显示成功，否则显示失败
-  使用 cat check.txt 显示文本内容
-  

```
john@john-TM1613:~/depot/ISO$ sha1sum ubuntu-20.10-desktop-amd64.iso 
5463898b5fdf07d446bcf06ee86815033fce5e3a  ubuntu-20.10-desktop-amd64.iso
john@john-TM1613:~/depot/ISO$ nano check.txt
john@john-TM1613:~/depot/ISO$ sha1sum check.txt
bf7538c317372e7bb91f176d089c3f0a2240beaf  check.txt
john@john-TM1613:~/depot/ISO$ sha1sum -c check.txt
ubuntu-20.10-desktop-amd64.iso: 成功
john@john-TM1613:~/depot/ISO$ cat check.txt
5463898b5fdf07d446bcf06ee86815033fce5e3a  ubuntu-20.10-desktop-amd64.iso
john@john-TM1613:~/depot/ISO$ 

```

:heart: 使用 echo命令 生成  check1.txt，如下：
```
john@john-TM1613:~/depot/ISO$ echo '5463898b5fdf07d446bcf06ee86815033fce5e3a  ubuntu-20.10-desktop-amd64.iso' > check1.txt
john@john-TM1613:~/depot/ISO$ cat check1.txt
5463898b5fdf07d446bcf06ee86815033fce5e3a  ubuntu-20.10-desktop-amd64.iso
john@john-TM1613:~/depot/ISO$ sha1sum -c check1.txt 
ubuntu-20.10-desktop-amd64.iso: 成功

```
