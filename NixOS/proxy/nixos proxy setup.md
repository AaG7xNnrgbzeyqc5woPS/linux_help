  
- [ ** nixos-install.md**](https://gist.github.com/kuznero/dfacede512d5cbec42b6150ba1208063#file-nixos-install-md)
  
In order to install NixOS behind corporate proxy do the usual stuff but before running `nixos-install` set this environment variable:

```
export CURL_NIX_FLAGS="-x http://user:password@proxy:port/"
```


In addition in case you have ties to cloning from GitHub (like vim plugins), you should export proxy related variables:
```
export HTTP_PROXY=http://user:password@proxy:port/
export HTTPS_PROXY=http://user:password@proxy:port/
export http_proxy=http://user:password@proxy:port/
export https_proxy=http://user:password@proxy:port/
```


# my Config 2

```
export HTTP_PROXY=http://192.168.2.2:9995/
export HTTPS_PROXY=http://192.168.2.2:9995/
export http_proxy=http://192.168.2.2:9995/
export https_proxy=http://192.168.2.2:9995/
# http proxy server is ok! and break Great Fire Wall!

$ env | grep http  # for check env var

```

```
John@nixos:~]$ wget www.google.com
--2022-05-01 13:08:09--  http://www.google.com/
正在连接 192.168.2.2:9995... 已连接。
已发出 Proxy 请求，正在等待回应... 200 OK
长度：未指定 [text/html]
正在保存至: “index.html”

index.html                            [   <=>                                                        ]  13.67K  --.-KB/s  用时 1.9s    

2022-05-01 13:08:12 (7.18 KB/s) - “index.html” 已保存 [13995]

```
==test it OK!==

# upgrade nixos with https proxy
```
$ sudo -i
# cd /etc/nixos/
# export HTTP_PROXY=http://192.168.2.2:9995/
# export HTTPS_PROXY=http://192.168.2.2:9995/
# export http_proxy=http://192.168.2.2:9995/
# export https_proxy=http://192.168.2.2:9995/
# env | grep http 

# nixos-rebuild build
# nixos-rebuild build --upgrade

```
I finded that  nixos download packages speed is very fast with my proxy !
```
trying https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_101.0.4951.41-1_amd64.deb
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 80.4M  100 80.4M    0     0  9566k      0  0:00:08  0:00:08 --:--:-- 12.9M

```
==test ok! == 


# 总结：
  1. 关键点，要使用 http代理，sock5代理不行
  2. openwrt 设置 名称为tinyporxy的http/https代理,不用设置前置代理就能翻墙，
    似乎自动利用我前面设置的翻墙代理。不知道怎么回事，跟想象的不一样，也许我理解错了。
  3. 

#  behind a proxy
   install NixOS behind a proxy, do the following before running nixos-install.

Update proxy configuration in /mnt/etc/nixos/configuration.nix to keep the internet accessible after reboot.
networking.proxy.default = "http://user:password@proxy:port/";
networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
Setup the proxy environment variables in the shell where you are running nixos-install.

```
# proxy_url="http://user:password@proxy:port/"
# export http_proxy="$proxy_url"
# export HTTP_PROXY="$proxy_url"
# export https_proxy="$proxy_url"
# export HTTPS_PROXY="$proxy_url"
```

# See:

-   [**nixos-install.md**](https://gist.github.com/kuznero/dfacede512d5cbec42b6150ba1208063#file-nixos-install-md)
-   [**nixos roaming laptop: network proxy configuration**](https://www.reddit.com/r/NixOS/comments/6od9vy/nixos_roaming_laptop_network_proxy_configuration/)
-   [roaming laptop: network proxy configuration #27535](https://github.com/NixOS/nixpkgs/issues/27535)
