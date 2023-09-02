[Unit]
Description=Socat 1433 Port Forward
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/socat TCP-LISTEN:1433,reuseaddr,fork TCP:192.168.2.107:1433
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill $MAINPID

[Install]
WantedBy=multi-user.target
