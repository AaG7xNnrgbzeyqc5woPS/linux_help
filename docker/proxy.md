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
