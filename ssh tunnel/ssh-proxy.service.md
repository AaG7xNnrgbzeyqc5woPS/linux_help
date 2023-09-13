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

## 3.2 调试过程
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
-     改进，如果设置 该文件对 root 有读权限，ssh 程序禁止链接，ssh程序为了安全性，只允许owner 对 id文件拥有读写权限，组用户和其它用户读权限也不能有。
-     所以，只能另外想办法，最后 将 /home/john/.ssh/id_ed25519 文件拷贝到 /root/.ssh/id_ed25519
- id文件读取没有问题了，但是启动服务时候，ssh链接还是失败，想到是否 root 下还没有认证 ssh服务器，所以最后将 known_hosts 文件拷贝到 /root/.ssh下
- 这个时候，一切条件都满足了，启动 ssh-proxy.service 终于成功啦！

# 4 ssh-tunel 测试
- ssh-proxy.service 启动后，使用 firefox浏览器测试
- ❤️ firefox proxy 插件，需要设置为 sock5 模式，sock5://127.0.0.1:9889，💔其它http,https模式均不行！
- 打开 youbtube, google均成功！
- 调试后可用的 ssh-proxy.service 文件见 #1

# 5. 总结：
- linux 服务 关键要建立一个 ssh-proxy.service 服务定义文件
- 这个文件建立在 /etc/systemd/system/ 目录下，拥有者为 root:root
- 这个文件也可以是一个软链接，指向其它地方
- ssh tunnel 可以使用 -i 参数指定 私钥，-F 参数指定配置文件，不同于./ssh/config
- 配置文件，服务定义文件中的文件路径都要用 绝对路径，root拥有读权限。
- ssh 私钥 安全非常重要，只有拥有这owner才有读写权限，其它用户什么权限都没有。
- 自动登陆 ssh 需要事先准备好 known_hosts 文件，免得ssh 链接的时候认证 失败
- 

# 6，改进意见
- ssh-proxy.service 服务启动的时候，无法解析 ssh服务器的 域名，为了简单起见，直接用 ip地址。下一步可以 尝试用 域名，解决这个问题。
- 域名无法解析应该是 网络服务还没有完全启动。需要在服务定义文件 ssh-proxy.service 中强制要求 启动网络服务，这个怎么设置，需要查查帮助，留给下一次实验再做吧。

# 7. 调试中遇到的难点：
  - 多次遇到问题是，建立的软链接对应的文件不存在，或者软链接路路径错误。直接拷贝帮助文件中的命令导致的错误。需要仔细检查，必要的时候，使用 cat /etc/systemd/system/ssh-proxy.service 显示内容，如果是错误的软链接，显示的内容就不会对。 
