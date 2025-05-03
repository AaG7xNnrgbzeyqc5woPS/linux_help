参看这篇文章:
https://github.com/AaG7xNnrgbzeyqc5woPS/V2_shell/blob/master/v2ray_docker_client_manjaro 

Get Docker CE for Debian
https://docs.docker.com/v17.12/install/linux/docker-ce/debian/

Get Docker CE for CentOS
https://docs.docker.com/v17.12/install/linux/docker-ce/centos/

Post-installation steps for Linux
https://docs.docker.com/v17.12/install/linux/linux-postinstall/

# 启动docker服务
 Start Docker
  
    sudo systemctl start docker

Check Docker status

    sudo systemctl status docker
    
To start docker on boot, use this command

    sudo systemctl enable docke

# 普通用户使用运行docker的方法
Step 3. Configure Docker user
By default, only user with root or sudo privileges can run or manage Docker.   
If you want to run docker without root privileges or without having to add sudo everytime, do the following

*sudo usermod -aG docker $USER

Then, reboot 
