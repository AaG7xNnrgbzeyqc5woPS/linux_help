

```
which iptables
whereis iptables

有以上信息表示已安装，若没有安装，请执行安装命令，如下：

sudo apt-get install iptables

设置规则如下，执行命令：vi /etc/iptables.rules——在/etc/创建一个文件iptables.rules,添加规则，譬如：

*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -s 127.0.0.1 -j ACCEPT　　#允许本机(127.0.0.1)访问所有协议的端口
-A INPUT -p tcp -m multiport --dports 80,43,8005 -j ACCEPT　　#允许全部ip访问80,43,8005端口
-A INPUT -s 11.11.11.11/12 -p tcp -m tcp --dport 4800 -j ACCEPT　　#允许两个ip：11.11.11.11,11.11.11.12访问多4800端口
-A INPUT -s 11.11.11.11/12 -p tcp -m multiport --dports 90,91,92 -j ACCEPT   #允许两个ip:11.11.11.11,11.11.11.12访问多个端口：90，91，92
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT

复制代码

 

设置后执行命令使防火墙生效：

iptables-restore < /etc/iptables.rules

 

修改/etc/network/interfaces，设置开机自动加载，添加下面2条语句：

pre-up iptables-restore < /etc/iptables.rules
post-down iptables-save > /etc/iptables.rules

 

查看防火墙规则是否生效，执行命令：

iptables -L -n

ubuntu中没有直接停止关闭iptables的命令，需要执行：
复制代码

iptalbes -F
iptables -X
iptables -Z
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
modprobe -r ip_tables

复制代码

 

启动iptables

modprobe ip_tables

```
