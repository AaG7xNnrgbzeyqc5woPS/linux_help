# 1. SQL Server 端口 1433/1434
- [SQL Server: Frequently Used Ports](https://social.technet.microsoft.com/wiki/contents/articles/13106.sql-server-frequently-used-ports.aspx)
- [SQL Server Browser Service](https://learn.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms181087(v=sql.105)?redirectedfrom=MSDN)
- [How to Enable Remote Connections on SQL Server](https://social.technet.microsoft.com/wiki/contents/articles/1533.how-to-enable-remote-connections-on-sql-server.aspx)


# 2. 任务需求一
  服务器在 virtual box 虚拟机内，使用NAT模式对外提供服务，virtual box 需要进行端口映射。如何进行？
  
  注释：使用 桥接模式已经成功，比较简单。但是我们要 用zerotier vpn网络，
   windows xp不能安装 zerotier，也就是在 sql server 2000所在的虚拟机 windows xp上 无法安装zerotier
   所以想着使用 NAT模式将 虚拟机上的端口映射到 主机上，再走 zerotier网络。应该可行，先做第一步，NAT映射。
   成功后在测试 zerotier网络上 是否可以访问。
   
# 3. 实验环境 
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

## sql server 服务器 vm1
 - 操作系统 windows xp professional 2002 + sp3
 - SQL SERVER 2000 + sp4
 - SQL server port 1433
 - 网络命令：
 ```
 ipconfig
 netstat -ano
 ```
## SQL client 客户端 vm2
- 操作系统 windows xp professional 2002 + sp3
- SQL SERVER 2000 + sp4
- SQL server port 1433
- 是上一个系统的科隆（clone）版
- ❤️ 注意: clone后，必须更改ip,更改 mac地址，否则同服务器的vm1冲突
- 计算机名最好也更改，可惜改不了，没有域控制器，这个虚拟机已经加入域。
- 计算机名称不是必须修改，不影响SQL通讯

# 4. 实验一 修改 vm1 的虚拟网络配置
## 4.1 vm1 改为 NAT 模式，设置端口转发
  - vm1 虚拟机选择"设置\网络\网卡1\链接方式"选择为，网络地址转换(NAT)
  - vm1 虚拟机选择"设置\网络\网卡1\高级\端口转发"，弹出端口转发窗口
  - vm1，在端口转发窗口，右边点 + 号键，增加一条端口转发规则。
  - 端口转发规则配置：主机IP：0.0.0.0，主机端口：1433，子系统IP：127.0.0.1，子系统端口：1433
  - 点 确定，保存并且关闭端口转发规则窗口
  - 再点 确定，保存并且关闭 “设置”窗口
  - ❤️ 设置窗口处，如果一个 设置项没有变灰，那么说明是可以修改配置，并且保存设置后立即其作用，即使虚拟机(此刻是vm1)当前仍然在运行，不必费尽关闭虚拟机。
  - ❤️ 可以用下面的命令在主机命令行中测试配置效果： ``` netstat -l | grep tcp ```


   
  
