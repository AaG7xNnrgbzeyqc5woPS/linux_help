# See：
- [解决 VMware 无法开启 Intel VT-x 的问题](https://www.liedou.cc/2024/06/17/solve-unsupported-intel-vt-x/)
- [64位win10系统中无法开启vmware的VT-X嵌套虚拟化功能的解决方法](https://www.cnblogs.com/virtualnet/p/4864202.html)
- [Windows10 VT-x无法开启的解决](https://www.cnblogs.com/dylanchu/p/12879354.html)

  
# powershell 使用管理员，输入下列命令
```
bcdedit /set hypervisorlaunchtype off
```
必须使用重启，才生效！
关机再开机是不行的
