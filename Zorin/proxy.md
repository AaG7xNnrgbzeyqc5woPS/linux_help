# 1. Apt work with proxy server
- [How to Use APT with Proxy on Ubuntu and Debian](https://linuxiac.com/how-to-use-apt-with-proxy/)

```
sudo touch /etc/apt/apt.conf.d/proxy.conf
sudo nano /etc/apt/apt.conf.d/proxy.conf
cat /etc/apt/apt.conf.d/proxy.conf
Acquire {
  HTTP::proxy "http://proxy_server:port/";
  HTTPS::proxy "http://proxy_server:port/";
}

sudo apt update
sudo apt upgrade
sudo apt autoremove


```
This way is Ok! Test it OK!

# 2. snap work with proxy server
- [How to install snap packages behind web proxy on Ubuntu 16.04](https://askubuntu.com/questions/764610/how-to-install-snap-packages-behind-web-proxy-on-ubuntu-16-04)

## 2.1 snap set 
```
$ sudo snap list
$ sudo snap install hello-world
$ sudo snap set system proxy.http="http://<proxy_addr>:<proxy_port>"
$ sudo snap set system proxy.https="http://<proxy_addr>:<proxy_port>"
$ sudo systemctl restart snapd
```
This way is ok! Test it OK!

## ❤️ 2.2 /etc/environment, Good job
> Snap uses snapd daemon. You only need to define http_proxy and https_proxy in /etc/environment and restart the service: systemctl restart snapd.

```
$ sudo nano /etc/environment
   # Add a line: http_proxy="192.168.2.2:9995"
   # Add a line: https_proxy="192.168.2.2:9995"
$ cat /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
http_proxy="192.168.2.2:9995"
https_proxy="192.168.2.2:9995"
$ sudo systemctl restart snapd
$ sudo snap list
$ sudo snap install ...
$ neofecth

```
Test it Ok! This is better way than "## 2.1  snap set "






