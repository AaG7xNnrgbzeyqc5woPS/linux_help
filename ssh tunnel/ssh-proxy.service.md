# 1. ssh-proxy.service
```
# cat ssh-proxy.service 
[Unit]
Description=SSH Proxy for Sock5 
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/ssh -F /home/john/.ssh/config -i /root/.ssh/id_ed25519 -N -D 9889 sbox
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill $MAINPID

[Install]
WantedBy=multi-user.target

```
