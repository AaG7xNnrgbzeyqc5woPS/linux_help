# See:
 - [zerotier account](https://my.zerotier.com/account)
 - [zerotier network](https://my.zerotier.com/network)
 - [利用zerotier实现科学上网 ](https://www.mcetf.com/index.php/2021/08/01/%E5%88%A9%E7%94%A8zerotier%E5%AE%9E%E7%8E%B0%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91/)
 - [通过ZEROTIER ONE组建虚拟局域网实现内网穿透、异地客户端组网（以群晖和openwrt为例）](https://libertyleadingnetwork.blogspot.com/2019/05/ipzerotier-one.html)
 - [共享翻墙通道的翻墙方式-ZeroTier ](https://briteming.blogspot.com/2015/02/zerotier.html)
 - [启用 ZeroTier 的 VPN 功能，通过 VPN 转发客户端流量](https://github.com/aturl/awesome-anti-gfw/blob/master/ZeroTier/ZeroTier%27s_VPN.md)
 - [放弃moon节点，直接搭建Zerotier根服务器 ](https://post.smzdm.com/p/apxkx2m7/)
 - [远程办公：ZeroTier异地组网及私有Moon转发节点搭建](https://post.smzdm.com/p/adwrepgk/)
 - [zerotier翻牆](https://softwarebrother.com/entry/zerotier%E7%BF%BB%E7%89%86.html)
 - ❤️ [用 ZeroTier 实现内网穿透](https://blog.quantumghost.dev/use-zerotier-for-remote-access.html)
 - [zerotier-nat.sh](https://gist.github.com/QuantumGhost/4b14369fd120d52c9afbc2081b62d336)

# See:
 - [Understanding Different NAT Types and Hole-Punching](https://dh2i.com/kbs/kbs-2961448-understanding-different-nat-types-and-hole-punching/)
 - [Network address translation - wikipedia](https://en.wikipedia.org/wiki/Network_address_translation)
 - [Why is symmetric NAT called "symmetric"?](https://networkengineering.stackexchange.com/questions/67218/why-is-symmetric-nat-called-symmetric)

# See:
  - [zerotier download](https://www.zerotier.com/download/)
  - [ZeroTier Knowledge Base](https://zerotier.atlassian.net/wiki/spaces/SD/overview)
  - [zerotier-cli](https://zerotier.atlassian.net/wiki/spaces/SD/pages/29065282/Command+Line+Interface+zerotier-cli)
  - [Private Root Servers - a.k.a. Moons](https://docs.zerotier.com/zerotier/moons)
  
# install 

If you have GPG installed, a more secure option is available:

```
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
```
After using the script, use apt or yum to manage future updates to zerotier-one

# Setup

- Step 1
Create a ZeroTier account to access your admin console and get a 16-digit network ID. Create as many networks as you like and each will be assigned a 16-digit network ID.

- Step 2
Download ZeroTier on any device to get a unique 10-digit node address and enter your 16-digit network ID into the join network field on the device to request access to your network.

- Step 3
Check the Auth checkbox on your admin console when your 10-digit node address presents itself.
If a friend wants to join your network they can do so in the exact same way.


  
