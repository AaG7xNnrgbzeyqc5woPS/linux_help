# 1. ssh-proxy.service
```
# cat ssh-proxy.service 
[Unit]
Description=SSH Proxy for Sock5 
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/ssh -F /home/john/.ssh/config -i /root/.ssh/id_ed25519 -N -D 9889 sbox
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill $MAINPID

[Install]
WantedBy=multi-user.target

```

# 2. 背景
- 为了更方便的使用 ssh tunnel 科学上网，想将原先的ssh tunnel指令做成服务  
- 原先经过验证可用的指令：ssh -N -D 9889 sbox &  
- sbox是 ~/.ssh/config 配置文件 中的一个配置项    

~/.ssh/config  
```
# ~/.ssh/config
Host sbox
#HostName sbox.domain.local
HostName *.*.*.* ip adress
User root
IdentityFile /home/john/.ssh/id_ed25519
Port 22
IdentitiesOnly yes
ServerAliveInterval 60
ServerAliveCountMax 15
```

# 3. ssh-proxy.service 调试过程
## 3.1 使用软链接方便管理
```
# cd ~
# mkdir ~/service
# cd service
# nano ssh-proxy.service
# sudo ln -s /home/john/service/ssh-proxy.service /etc/systemd/system/ssh-proxy.service
# #注意需要使用 root用户建立软链接，/home/john/service/ssh-proxy.service 文件最好也是属于 root用户
# # sudo chown root:root /home/john/service/ssh-proxy.service 可以使用这个指令这只文件所有者为 root用户

```

## 3.2 第一次调试
使用以下命令调试ssh-proxy服务
```
# sudo systemctl status
# sudo systemctl status ssh-proxy.service
# sudo systemctl enable ssh-proxy.service
# sudo systemctl start ssh-proxy.service
# sudo systemctl daemon-reload

```
发现以下问题：  
- 找不到配置文件，~/.ssh/config，无法解析sbox, 因为服务使用不同用户root，改正方法，使用F 参数，指定配置文件，配置文件使用绝对路径，不管什么用户都可以访问，只只需要读权限就可以。
- 认证不通过，配置文件中使用绝对地址的私钥。
- 认证还是不通过，改进，在 ssh-proxy.service 文件中的ssh 命令使用 -i 参数指定绝对路径的私钥。
- 还是不能通过，检查后发现，john用户的私钥的对root没有读权限。
- 改进，如果设置 该文件对 root 有读权限，

