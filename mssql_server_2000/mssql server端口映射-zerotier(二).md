#See:
- [sqlserver端口映射.md](https://github.com/AaG7xNnrgbzeyqc5woPS/linux_help/blob/master/mssql_server_2000/sqlserver%E7%AB%AF%E5%8F%A3%E6%98%A0%E5%B0%84.md)

# 在zerotier环境下使用SQL_SERVER
- zerotier环境已经配置好了
- 使用 https://key-networks.com/ 自己建立网络控制器
- mssql server 2000+sp4 安装在 windows xp+sp3操作系统上， 该虚拟机 驻扎在 ubuntu 20.04+virutal box 6.1主服务器上
- 问题：zerotier 不支持 windows xp, 所以虚拟机不能直接接入zerotier虚拟网络。
- 解决方法：使用端口映射，将 windows xp接入zerotier，让zerotier网上的客户机能够访问windows xp上的 sql server服务

# 映射方案
   - 参考上一篇文章 [sqlserver端口映射.md](https://github.com/AaG7xNnrgbzeyqc5woPS/linux_help/blob/master/mssql_server_2000/sqlserver%E7%AB%AF%E5%8F%A3%E6%98%A0%E5%B0%84.md)
   - 映射方案采用上一篇文章中的“总结一简单方案”如下，
   - 💯 主机：0.0.0.0:1433, 子系统：10.0.2.15:1433

# 测试一 在本地网络测试
 - 上一篇文章已经测试过，OK
 - sql server 服务器(win xp os)使用 nat模式，再加上端口映射 💯 主机：0.0.0.0:1433, 子系统：10.0.2.15:1433，接入局域网中
 - sql client (winxp os),使用桥接模式接入局域网。客户机可以访问主服务器ubuntu 1433端口。
 - sql server 企业管理器可以链接主服务器的1433，也就是链接到 vm1 winxp上的sql server
 - 一切 ok

# 测试二 在 zerotier 网络上访问 winxp 上的 SQL Server 2000
 - 服务器端，vm1 通过 nat + 端口映射 的方式链接到 主机ubunutu，主机接入 zerotier
 - 客户端使用 windows 10 + SQL SERVER 2019企业管理器
 - 客户端和服务器端是两台独立的实体电脑，通过wifi链接到同一个路由器，然后再链接到internet互联网
 - 客户端和服务器再同一个wifi网络下，不能简单互相访问，wifi为了安全，已经关闭了下属电脑手机互访功能，
 - 所以直接输入局域网的ip是链接不了的，实际测试也是如此
 - 只能直接输入 服务器的 zerotier ip地址,
 - 结果一次就链接成功！
 - ❤️ SQL SERVER 2019企业管理器 通过 zerotier 链接到 sql server 2000，成功！

# 测试三 不同城市通过 zerotier互联（未测试）
  - 客户端和服务器端在不同城市。使用 SQL SERVER 企业管理器，通过 zerotier 链接 winxp 下的 sql server 2000服务器

# 测试四 不同城市sql应用链接sql数据库
  - 客户端应用 在 win xp下，数据库服务器在另外一个城市的windows xp下
  - 这两台虚拟机vm1,vm2在不同城市，一个里面运行 需要连接sql server数据库的应用程序，一个运行着sql server 数据库
  - 配置合适连接会成功！

# 总结：  我们最后的网络配置如下：
  - vm1 运行着 服务器，通过nat+ portmap方式连接主机1，
  - vm2 运行着客户端，通过 nat 方式连接主机2
  - 主机1和主机2都加入了zerotier中的一个私有局域网(vpn)
  - vm2 就可以访问 vm1服务器了！

