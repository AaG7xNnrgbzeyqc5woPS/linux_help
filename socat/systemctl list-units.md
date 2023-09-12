您可以使用以下命令来查看这些服务的英文名字：

systemctl list-units | grep -i service

这将显示系统中所有正在运行的服务的列表，包括他们的英文名字。

例如，以下是显示网络服务、DNS 服务和 SSH 服务英文名字的输出：

NETWORKING.service
NETWORKD-dispatcher.service
networkd.service
nss-lookup.service
nss-resolve.service
sshd.service
