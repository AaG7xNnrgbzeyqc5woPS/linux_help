# See:
- [How to Create SSH Tunnels](https://www.tunnelsup.com/how-to-create-ssh-tunnels/)
- ❤️[SSH Tunneling Explained](https://goteleport.com/blog/ssh-tunneling-explained/)
- [SSH Tunneling](https://www.ssh.com/academy/ssh/tunneling)
- [SSH Tunneling: Examples, Command, Server Config](https://www.ssh.com/academy/ssh/tunneling-example)
- [How to Use SSH Tunneling to Access Restricted Servers and Browse Securely](https://www.howtogeek.com/168145/how-to-use-ssh-tunneling/)
- [How to Set up SSH Tunneling (Port Forwarding)](https://linuxize.com/post/how-to-setup-ssh-tunneling/)
- 💙[OpenSSH/Cookbook/Proxies and Jump Hosts](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts#Passing_Through_a_Gateway_with_an_Ad_Hoc_VPN)
- ❤️[OpenSSH-wikibooks](https://en.wikibooks.org/wiki/OpenSSH)
- ❤️[一键安装最新内核并开启 BBR 脚本](https://teddysun.com/489.html)
- 💙[Ip Tunnel Over Ssh With Tun ](https://www.marcfargas.com/2008/07/ip-tunnel-over-ssh-with-tun/)

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

# Autossh

The autossh command is used to add persistence to your tunnels. The job it has is to verify your ssh connection is up, and if it’s not, create it.

Here is an autossh command which you may recognize.

`autossh -N -i /home/blueuser/.ssh/id_rsa -R 2222:localhost:22 greenuser@192.168.0.3`

The -i /home/blueuser/.ssh/id_rsa option says to use a certificate to authenticate this ssh connection. Check out this post to learn more about ssh certificates.

Now when your tunnel goes down it will automatically try to reconnect and keep trying until it is successful. To make it persistent through a reboot, add the ssh command as a cron job.

# ❤️[一键安装最新内核并开启 BBR 脚本](https://teddysun.com/489.html)
 - 购买服务器后，可以使用上面的 ssh -N -D 9889 SSH_SEERVER 命令建立翻墙代理
 - Firefox 的 代理插件设置，使用 sock5://127.0.0.1:9889，亲测有效！
 - 注释：用其它协议无效，sock4,http,https 都无效，已经一一测试过，不用再测试了。
 - 可以浏览github,继续安装更专业的翻墙代理了
 - 第一件事情就是 打开 BBR，这样 ssh隧道速度超快
 - 注意：ssh隧道流量太大，会受到神秘力量的干扰，会断流。
 - 所以还是尽快 安装更专业的代理吧
