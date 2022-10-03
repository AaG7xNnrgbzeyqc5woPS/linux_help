# 0. See:
- ❤️ [linux系统安装m1136打印机,Ubuntu 安装及共享打印机](https://blog.csdn.net/weixin_34808718/article/details/116672640)
- [HP打印机的Linux驱动程序 ](https://download.csdn.net/download/ws_20100/9189683?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-download-2%7Edefault%7ECTRLIST%7EFeaturesSort-1-9189683-blog-116672640.pc_relevant_aa_2&depth_1-utm_source=distribute.pc_relevant_t0.none-task-download-2%7Edefault%7ECTRLIST%7EFeaturesSort-1-9189683-blog-116672640.pc_relevant_aa_2&utm_relevant_index=1)
- [HP LaserJet M1136 MFP Scanner Driver Download, Install, and Update - windows PC](https://www.techpout.com/hp-laserjet-m1136-mfp-scanner-driver/)
- [HP Customer Support - Software and Driver Downloads](https://support.hp.com/us-en/drivers/selfservice/hp-laserjet-pro-m1136-multifunction-printer-series/5094778/model/4075451)
- [HP LaserJet Professional m1136 Multifunction Printer](https://developers.hp.com/hp-laserjet-professional-m1136-multifunction-printer)
- [HP Laserjet M1136 MFP in Ubuntu 16.04](https://askubuntu.com/questions/815275/hp-laserjet-m1136-mfp-in-ubuntu-16-04)
- [HP M1136打印机在Unbuntu 20.04下工作](https://zhuanlan.zhihu.com/p/357636206)
- [Linux的打印服务CUPS的安装、配置和使用](https://www.cnblogs.com/leaven/archive/2010/10/20/1856482.html)
- [使用 CUPS Web 浏览器界面设置和管理打印机 ](https://docs.oracle.com/cd/E26926_01/html/E25812/gllhj.html)
- 


# 1. 安装打印机驱动
 ## 1.1 install hp 软件包
- sudo apt search hplip 

- sudo apt install hplip-gui
- sudo apt-get install hplip

## 1.2. install hp driver
- 必须打印机连接后才能成功安装驱动
GUI界面
```
sudo hp-setup 
```

命令行 CLI:
```
sudo hp-setup -i 
```

## 1.3. 查看驱动是否安装成功
- lpstat -p
- 如果出现打印机型号、日期等信息说明驱动安装成功

## 1.4. 打印测试页

# 2. 共享打印机设置
## 2.1 安装cups
sudo apt install cups

## 2.2 cups配置
- firefox 访问地址：https://127.0.0.1:631
- 进入administrator页签,右侧Server栏下,勾选”Share printers connected to this system”,
- 这样默认是在本地网络上共享打印机,只有同一个网段的主机才能通过网络使用这台打印机。
- 如果同时勾选了”Allow printing from the Internet”,则所有通过网络可以访问这台主机的机器都可以使用这台打印机。

## 2.3 cups高级配置
- firefox 访问地址：https://127.0.0.1:631
- /etc/
Encryption Never
#表示访问管理员页面无需对密码加密 

```
DefaultAuthType Basic  
改为 ：   
DefaultAuthType None
```

```
认证类型的取值（值域）：
      AuthType None
      AuthType Basic
      AuthType Default
      AuthType Negotiate
            Specifies the type of authentication required.  The value "Default" corresponds to the DefaultAuthType value.
```

## 2.4. 配置文件
 - /etc/cups/cupd.conf


 ```
 cd /etc/cups
 ls -l
 sudo nano cupsd.conf
 
 增加修改：
 # Listen 0.0.0.0:631
 Browsing On
 DefaultShared Yes
 
 ```
 **下面这段，修改成这样：**
 去掉网页访问认证，这样访问 https://127.0.0.1:631 的管理员配置项，就不用输入密码了
 ```
 # Restrict access to configuration files...
<Location /admin/conf>
#  AuthType Default
#  Require user @SYSTEM  # by hwt 2022.10.2
#  AuthType None
  Order allow,deny
</Location>

 ```
 
 
 
**注意：网页中修改配置，会重写 cupsd.conf，您在该文件中写的注释将会全部丢失！**

 







