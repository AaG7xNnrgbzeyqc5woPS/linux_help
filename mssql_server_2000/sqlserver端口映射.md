# 1. SQL Server 端口 1433/1434
- [SQL Server: Frequently Used Ports](https://social.technet.microsoft.com/wiki/contents/articles/13106.sql-server-frequently-used-ports.aspx)
- [SQL Server Browser Service](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms181087(v=sql.105)?redirectedfrom=MSDN)
- [How to Enable Remote Connections on SQL Server](https://social.technet.microsoft.com/wiki/contents/articles/1533.how-to-enable-remote-connections-on-sql-server.aspx)


# 任务需求一
  服务器在 virtual box 虚拟机内，使用NAT模式对外提供服务，virtual box 需要进行端口映射。如何进行？
  
  注释：使用 桥接模式已经成功，比较简单。但是我们要 用zerotier vpn网络，
   windows xp不能安装 zerotier，也就是在 sql server 2000所在的虚拟机 windows xp上 无法安装zerotier
   所以想着使用 NAT模式将 虚拟机上的端口映射到 主机上，再走 zerotier网络。应该可行，先做第一步，NAT映射。
   成功后在测试 zerotier网络上 是否可以访问。
   
# 实验环境 
## 主机 host
 - 主机是笔记本，操作系统是 ubunut 20.04,升级到最新。
 - 主机安装了 virtual box V6.1.38 虚拟机管理软件
 - 主机网络地址：192.168.2.106/24
 - 主机 网络配置查看命令：
  ```
  ip -4 addr
  netstat -l
  netstat -l | grep tcp
  ```

## sql server 服务器

   
   
  
