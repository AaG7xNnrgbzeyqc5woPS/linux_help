# 0. See:
- [KMS主机使用指南](https://blog.51cto.com/timethin/308260)
- [教程-浅谈KMS自动发现激活原理](https://www.52asus.com/thread-14202-1-1.html)
- [win10手动kms激活步骤 kms手动命令激活win10方法](http://www.xitongcheng.com/jiaocheng/win10_article_45712.html)
- [可用的kms激活服务器有哪些|怎么看kms服务器能不能正常使用](http://www.xitongcheng.com/jiaocheng/dnrj_article_44606.html)
- [三种自建KMS激活系统自动激活windows方法](https://www.bilibili.com/read/cv12741231)
- [OpenWrt 搭建 KMS 服务器](https://www.mivm.cn/openwrt-kms)
- ❤️[Key Management Services (KMS) client activation and product keys](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys)
- ❤️[GVLKs for KMS and Active Directory-based activation of Office, Project, and Visio](https://docs.microsoft.com/en-us/deployoffice/vlactivation/gvlks
)
- [基于路由openwrt固件激活WINDOWS+OFFICE的步骤](https://www.vjsun.com/629.html)


# 1. kms服务器测试
```
  ping www.zgbs.cc   
  ping cy2617.jios.org
  ping kms.digiboy.ir
  ping kms.luody.info 
  ping kms.dwhd.org
```
  以上服务器测试OK, 测试时间: 2021.11.23 9:50
  
 # 2. 激活Windows 专业版

- 注意：仅 Windows Vista 及以上系统可以使用 KMS 激活，且 Windows7 旗舰版 不支持 KMS 激活。
- 这里以 Windows 10 专业版和 Office 2016 为例演示如何激活。
- ❤️KMS 激活也需要密钥，且每个系统版本的密钥不同，不过只有 1 个密钥，比如 Windows 10 专业版的密钥：W269N-WFGWX-YVC9B-4J6C9-T83GX
- Windows KMS 密钥：https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys
- Office KMS 密钥：https://docs.microsoft.com/en-us/deployoffice/vlactivation/gvlks

``` 
右键开始菜单，点击 [命令提示符 (管理员)] 或 [Windows PowerShell (管理员)]
输入 slmgr /upk 卸载原有密钥，如果是刚装好的系统，这一步可以省略。
输入 slmgr /skms 192.168.1.1 设置 KMS 服务器地址，如果你的路由器 IP 不是 192.168.1.1，记得改一下。
输入 slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX 安装 KMS 密钥
输入 slmgr /ato 查看激活状态，如果显示 “成功地激活了产品”，表示激活成功，
每隔 180 天会自动续订，不需要担心激活过期。
```

# 3. OFFICE激活：

第一步、找到你的OFFICE目录

我的是OFFICE 2016 32位版，目录为：

C:\Program Files (x86)\Microsoft Office\Office16

进去这个目录，可以看见有个OSPP.VBS文件

如果是OFFICE 2016 64位版，目录应为：

C:\Program Files\Microsoft Office\Office16

第二步、powershell中cd “C:\Program Files (x86)\Microsoft Office\Office16”（双引号中对应你的实际目录）

第三步、输入cscript ospp.vbs /sethst:192.168.50.1（你的路由IP）

第四步、输入cscript ospp.vbs /act

接下来享受激活的WINDOWS和OFFICE吧（使用系统自身批处理命令激活，因此不可能有后门，不用担心病毒和信息窃取之类的）。如果失败，请检查WINDOWS和OFFICE具体版本信息。
