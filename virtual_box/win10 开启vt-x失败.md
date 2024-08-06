# See：
- [解决 VMware 无法开启 Intel VT-x 的问题](https://www.liedou.cc/2024/06/17/solve-unsupported-intel-vt-x/)
- [64位win10系统中无法开启vmware的VT-X嵌套虚拟化功能的解决方法](https://www.cnblogs.com/virtualnet/p/4864202.html)
- [Windows10 VT-x无法开启的解决](https://www.cnblogs.com/dylanchu/p/12879354.html)

  
# 一、powershell(管理员),输入下列命令
```
bcdedit /set hypervisorlaunchtype off
```
- 必须使用重启，才生效！关机再开机是不行的！
- ❤️重点：必须使用重启，才生效！关机再开机是不行的！亲测有效！
- 第一次关机，无效，第二次，使用重启，成功！
- 成功的判断方法：使用软件 LeoMoon CPU-V 判断！

# 二、问题及分析：
1，  windows 10 做为宿主机下，使用 virtual box 做虚拟机管理系统。windows xp 作为客户机，
一直存在不稳定的情况。现在已经查明，是  windows 10 的  Hyper-V 与 virtual box 相冲突。
2，本来 各个厂家有个协议，让虚拟机管理系统互相兼容，希望能共存。
   但是实际情况并不理想，导致有时候还能用，有的时候不能用。
3，最彻底的解决方案是，关闭 windows 自身的 Hyper-V
4，经过实践，关闭Hyper-V后，两个虚拟机，一个delphi-xp开发机，一个是xp-administrator,使用都非常好，
   导入进来就没有问题，速度非常快。升级 virtual box到最新版（客户端也升级到最新），测试也没有问题。
5，不完美的地方：客户机xp上的字体不是很清晰

#  三、LeoMoon CPU-V
  注释1：
     当然还有一个前提，电脑cpu支持 VT-X，并且在 BIOS中已经开启。
     这两个都可以在 LeoMoon CPU-V 中查看。
  
  注释2：
  LeoMoon CPU-V 下载地址
  https://leomoon.com/downloads/desktop-apps/leomoon-cpu-v/
