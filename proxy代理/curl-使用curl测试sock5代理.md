
# 以下命令可以用于测试 sock5代理的有效性
------------------------------------------
```
curl --socks5 10.147.19.21:9889 http://icanhazip.com               # ok!
curl --socks5 10.147.19.21:9889 https://www.baidu.com/             #  ok !
curl --socks5 10.147.19.21:9889 https://www.google.com/            # No data!
curl --socks5-hostname 10.147.19.21:9889 https://www.google.com/   # ok!
curl --proxy socks5h://10.147.19.21:9889 https://www.google.com/   # ok!
```
-  sock5:10.147.19.21:9889 is OK!
-  ```--socks5-hostname 10.147.19.21:9889  ```, 使用远程主机解析dns
-  ```--proxy socks5h://10.147.19.21:9889  ```, 使用远程主机解析dns
-  --socks5h: 使用远程主机解析dns
-  --socks5-hostname  使用远程主机解析dns
