# See:
- [ AaG7xNnrgbzeyqc5woPS/docker ](https://github.com/AaG7xNnrgbzeyqc5woPS/docker)
- [install docker at manjaro](https://github.com/AaG7xNnrgbzeyqc5woPS/docker/blob/master/docker%20install.md)
- []()

# 一键安装脚本

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# 

```
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

sudo usermod -aG  docker john
sudo reboot   //logout

docker info
docker version
docker --version

docker run hello-world
```
