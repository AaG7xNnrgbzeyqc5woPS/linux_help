# 0. See:
   - [Ubuntu Server 系统实现自动更新](https://www.linuxidc.com/Linux/2019-08/160242.htm)
   - [https://www.jb51.net/os/Ubuntu/451927.html](https://www.jb51.net/os/Ubuntu/451927.html)
   - [如何在Ubuntu服务器上使安全更新每天自动进行](https://jingyan.baidu.com/article/414eccf644e6bb6b431f0a93.html)

# 1. 简单的方法
     sudo dpkg-reconfigure -plow unattended-upgrades 
