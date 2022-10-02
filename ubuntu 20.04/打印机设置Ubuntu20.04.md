# See:
- [linux系统安装m1136打印机,Ubuntu 安装及共享打印机](https://blog.csdn.net/weixin_34808718/article/details/116672640)
- [HP打印机的Linux驱动程序 ](https://download.csdn.net/download/ws_20100/9189683?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-download-2%7Edefault%7ECTRLIST%7EFeaturesSort-1-9189683-blog-116672640.pc_relevant_aa_2&depth_1-utm_source=distribute.pc_relevant_t0.none-task-download-2%7Edefault%7ECTRLIST%7EFeaturesSort-1-9189683-blog-116672640.pc_relevant_aa_2&utm_relevant_index=1)
- [HP LaserJet M1136 MFP Scanner Driver Download, Install, and Update - windows PC](https://www.techpout.com/hp-laserjet-m1136-mfp-scanner-driver/)
- [HP Customer Support - Software and Driver Downloads](https://support.hp.com/us-en/drivers/selfservice/hp-laserjet-pro-m1136-multifunction-printer-series/5094778/model/4075451)
- [HP LaserJet Professional m1136 Multifunction Printer](https://developers.hp.com/hp-laserjet-professional-m1136-multifunction-printer)
- [HP Laserjet M1136 MFP in Ubuntu 16.04](https://askubuntu.com/questions/815275/hp-laserjet-m1136-mfp-in-ubuntu-16-04)
- [HP M1136打印机在Unbuntu 20.04下工作](https://zhuanlan.zhihu.com/p/357636206)
- 
# install 
- sudo apt search hplip 

- sudo apt install hplip-gui
- sudo apt-get install hplip

# install hp driver
- 必须打印机连接后才能成功安装驱动
GUI界面
```
sudo hp-setup 
```

命令行 CLI:
```
sudo hp-setup -i 
```

# 







