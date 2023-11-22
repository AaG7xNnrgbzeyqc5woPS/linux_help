# 0. KMS Server
- [teddysun/kms](https://hub.docker.com/r/teddysun/kms)
- [kms/Dockerfile](https://github.com/teddysun/across/blob/master/docker/kms/Dockerfile)
- [Wind4/vlmcsd - kms source code](https://github.com/Wind4/vlmcsd)
- [Wind4/vlmcsd-docker & dockercompose](https://github.com/Wind4/vlmcsd-docker)

# 1. docker images 安装 
- [teddysun/kms](https://hub.docker.com/r/teddysun/kms)
- docker hub 直接下载images 安装，快捷方便,
- ❤️2023/11/22 安装成功！第一次安装，一次成功！


# 2. Wind4 KMS Docker
-  [Wind4 KMS Docker](https://github.com/Wind4/vlmcsd-docker)
- 上面这个链接是 原作者的 docker 文件！
- 使用docker安装简单便捷
- 这个需要编译images，有点麻烦，今天尝试了一次，失败！2023/11/22

# 3. git proxy 
- ❤️ tesk ok! 2023/11/22
- for git
- for apt
- for docker-compose up -d
- ubuntu 22.04 LTS AT "PVE CT 4G RAM"
```
sudo nano /etc/environment
# Add a line: http_proxy="http://192.168.2.2:9995"
# Add a line: https_proxy="http://192.168.2.2:9995"
# than reboot
# env | grep http
```
