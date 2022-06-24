# Apt work with proxy server
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
