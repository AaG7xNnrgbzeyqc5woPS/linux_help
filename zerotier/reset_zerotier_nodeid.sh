# filename: reset_zerotier_nodeid.sh
# reset nodeid(address), mac, ip
#systemctl status zerotier-one.service
#systemctl stop zerotier-one.service
#systemctl start zerotier-one.service

#zerotier-cli info
#zerotier-cli listnetworks
#zerotier-cli peers
 
# zerotier-cli leave <networkid>
# zerotier-cli leave <networkid>

systemctl stop zerotier-one.service
cd /var/lib/zerotier-one/
ls /var/lib/zerotier-one/id*.*
rm /var/lib/zerotier-one/id*.*
systemctl start zerotier-one.service
