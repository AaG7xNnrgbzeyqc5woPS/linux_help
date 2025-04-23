# filename: reset_zerotier_nodeid.sh
# reset nodeid(address), mac, ip
# 更改 ZeroTier 节点号（address）和 MAC 地址

# for linux ubuntu 22.04 lts
# 2025-4-23

#systemctl status zerotier-one.service
#systemctl stop zerotier-one.service
#systemctl start zerotier-one.service

#zerotier-cli info
#zerotier-cli listnetworks
#zerotier-cli peers
 
# zerotier-cli join <networkid>
# zerotier-cli leave <networkid>

systemctl stop zerotier-one.service
cd /var/lib/zerotier-one/
ls /var/lib/zerotier-one/id*.*
rm /var/lib/zerotier-one/id*.*
systemctl start zerotier-one.service
