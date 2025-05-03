docker 如何使用代理下载github映像文件？

# 为Docker守护进程配置代理 -AI教程

Docker拉取镜像时，代理需要配置在Docker守护进程（daemon）层面：

    创建或编辑代理配置文件：
```
sudo mkdir -p /etc/systemd/system/docker.service.d/
sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf
```
    写入代理环境变量（以本地代理127.0.0.1:7890为例）：
```
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"
Environment="ALL_PROXY=socks5://127.0.0.1:7890"
Environment="NO_PROXY=localhost,127.0.0.1"
```
    重新加载并重启Docker服务：
```
bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```
    验证代理设置：
```
bash
docker info | grep -A 10 "Registry Mirrors"
```
此时通过代理拉取镜像即可加速访问GitHub相关

# 2. 实验
## 2.1 编辑配置文件/etc/systemd/system/docker.service.d/http-proxy.conf
```
# mkdir -p /etc/systemd/system/docker.service.d/
# nano /etc/systemd/system/docker.service.d/http-proxy.conf

# cat /etc/systemd/system/docker.service.d/http-proxy.conf
[Service] 
Environment="HTTP_PROXY=socks5://192.168.2.21:9889" 
Environment="HTTPS_PROXY=socks5://192.168.2.21:9889" 
Environment="ALL_PROXY=socks5://192.168.2.21:9889"
Environment="NO_PROXY=localhost,127.0.0.1"

```
## 2.2 重启docker服务

```
systemctl daemon-reload
systemctl restart docker
```

## 测试成功
 - 运行命令成功：docker run hello-world
```
root@zt-sb-sock5-23:~/sb# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
e6590344b1a5: Pull complete 
Digest: sha256:c41088499908a59aae84b0a49c70e86f4731e588a737f1637e73c8c09d995654
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/


```

# 总结：
- ❤️关键问题：HTTP_PROXY=socks5://192.168.2.21:9889，一定要使用socks5:前缀，不能用 http:
- 同样，其它的代理，"HTTPS_PROXY=socks5://192.168.2.21:9889", 也要用sock5:前缀，不能用https:


