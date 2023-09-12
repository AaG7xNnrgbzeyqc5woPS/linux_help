# 0. See
- [How to create systemd service unit in Linux](https://linuxconfig.org/how-to-create-systemd-service-unit-in-linux)
- [How To Write A Simple Systemd Service](https://linuxconfig.org/how-to-write-a-simple-systemd-service)
- [How to create a systemd service in Linux](https://linuxhandbook.com/create-systemd-services/)

# 1. socat.service
```
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
```
# 2. 以下是设置服务的步骤总结：

    创建 /etc/systemd/system/socat.service 配置文件。
    在 Description 选项中指定服务的描述。
    在 After 选项中指定服务的依赖关系。
    在 Type 选项中指定服务的类型。
    在 ExecStart 选项中指定服务的启动命令。
    在 ExecReload 选项中指定服务的重启命令。
    在 ExecStop 选项中指定服务的停止命令。
    在 WantedBy 选项中指定服务的目标。
    使用 systemctl enable socat.service 命令启用服务。

# 3. 设置软链接
1. 为了 方便管理，将 socat.service 文件放在 home目录下   
   路径：/home/john/service/socat.service  
2. :在 ls /etc/systemd/system 路径下建立软链接  
  sudo ln -s  /home/john/service/socat.service /etc/systemd/system  
  注意：使用root用户，使用绝对路径
3. sudo ls /etc/systemd/system 查看软链接是否建立成功，如果是红色说明没有成功，可能是目的路径找到不到。

# 4. 启动服务 socat.service
4. sudo systemctl status socat.service  
5. sudo systemctl enable socat.service
6. sudo systemctl start socat.service
7. sudo systemctl daemon-reload  如果需要使用这条命令装载配置文件

# 5. 最后使用 sql server 应用程序，看看配置是否真正成功

