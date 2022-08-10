# See:
- [AaG7xNnrgbzeyqc5woPS/docker ](https://github.com/AaG7xNnrgbzeyqc5woPS/docker)
- ❤️[install docker at manjaro](https://github.com/AaG7xNnrgbzeyqc5woPS/docker/blob/master/docker%20install.md)


# 一键安装脚本

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# 使用 apt 命令安装

```
sudo apt  install docker.io  #关键，安装docker

# sudo systemctl enable docker  # 省略
# sudo systemctl start docker  # 省略

sudo systemctl status docker  # 查看docker服务状态
sudo usermod -aG  docker john  #重要，授权当前用户，使用whoami查找当前用户
sudo reboot   //logout        # 重要，不能省略。重新启动电脑，权限才生效！

# 以下测试是否安装好
docker info
docker version
docker --version

docker run hello-world
```
