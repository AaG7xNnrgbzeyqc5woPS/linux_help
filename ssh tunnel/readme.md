# See:
- [How to Create SSH Tunnels](https://www.tunnelsup.com/how-to-create-ssh-tunnels/)
- [SSH Tunneling Explained](https://goteleport.com/blog/ssh-tunneling-explained/)
- [SSH Tunneling](https://www.ssh.com/academy/ssh/tunneling)
- [SSH Tunneling: Examples, Command, Server Config](https://www.ssh.com/academy/ssh/tunneling-example)
- [How to Use SSH Tunneling to Access Restricted Servers and Browse Securely](https://www.howtogeek.com/168145/how-to-use-ssh-tunneling/)
- [How to Set up SSH Tunneling (Port Forwarding)](https://linuxize.com/post/how-to-setup-ssh-tunneling/)
- 

# 最简单最实用的动态端口转发
- 更准确应该叫**本地动态端口转发**
- 将本地主机A监听的端口X,所接受到的流量，通过ssh服务器B，转发到不特定的目标服务器C:Y端口，
- 目标服务器的IP和端口（C:Y）由客户机（U）发送到到A:X端口的链接动态指定，故叫**动态转发**!
- 注意：这里一共牵涉到 **4台主机**，比较复杂哟！
- ssh -N -D 本地监听端口 [远程SSH服务器链接参数]


```
  ssh SSH_SEERVER                  # 假设这是登陆 SSH_SEERVER 的指令
  ssh -N -D 9889 SSH_SEERVER       # 这一条指令可以建立一个动态端口转发，端口为 9889。
```
