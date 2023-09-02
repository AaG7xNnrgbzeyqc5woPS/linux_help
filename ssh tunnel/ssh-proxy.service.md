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
为了更方便的使用 ssh tunnel 科学上网，想将原先的ssh tunnel指令做成服务
原先经过验证可用的指令：ssh -N -D 9889 sbox &
sbox是 ~/.ssh/config 配置文件 中的一个配置项
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





