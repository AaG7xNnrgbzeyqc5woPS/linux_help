# see:
- [Default sshd_config file for Ubunu 20.04](https://askubuntu.com/questions/1338807/default-sshd-config-file-for-ubunu-20-04)

# see:
- [install SSH Server](https://github.com/AaG7xNnrgbzeyqc5woPS/linux_help/blob/master/ubuntu%2020.04/install%20SSH%20Server.md)
- [How to set up authorized keys for dropbear local to openssh remote](https://serverfault.com/questions/910973/how-to-set-up-authorized-keys-for-dropbear-local-to-openssh-remote)
- [使用 gropbear 生成私钥文件](https://github.com/AaG7xNnrgbzeyqc5woPS/OpenWrt/tree/master/ssh)
- [Linux 客户端 SSH 登录 Windows10 远程主机 ](https://github.com/felix-cao/Blog/issues/206)

# systemcl command
 加载 .service 文件
```
sudo systemctl daemon-reload
```
这条命令会重新加载 systemd 的配置文件，使新的 .service 文件生效。
4. 启动、停止、重启服务
Bash
```
sudo systemctl start your_service.service
sudo systemctl stop your_service.service
sudo systemctl restart your_service.service
```

5. 查看服务状态
Bash
```
sudo systemctl status your_service.service
```

6. 设置开机自启动
Bash
```
sudo systemctl enable your_service.service
```

7. 取消开机自启动
Bash
```
sudo systemctl disable your_service.service
```

启动服务：
Bash
```
sudo systemctl start my_script.service
```
