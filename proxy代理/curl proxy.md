# See:
- [如何让 curl 命令通过代理访问](https://linux.cn/article-9223-1.html)
- [curl 设置代理](https://zhuanlan.zhihu.com/p/58690128)
- [Curl 设置代理，看这篇就够了](https://droidyue.com/blog/2021/07/07/set-proxy-for-curl/)

# 使用 -x， --proxy 参数，这个优先级别最高
语法：
```
    curl -x <[protocol://][user:password@]proxyhost[:port]> url
    --proxy <[protocol://][user:password@]proxyhost[:port]> url
    --proxy http://user:password@Your-Ip-Here:Port url
    -x http://user:password@Your-Ip-Here:Port url
```
例子：
```
curl -x socks5://127.0.0.1:1024 http://www.google.com # -x 参数等同于 --proxy
```
```
curl -x "http://user:pwd@127.0.0.1:1234" "http://httpbin.org/ip"

```

> curl --proxy "http://user:pwd@127.0.0.1:1234" "http://httpbin.org/ip"

由于代理地址的默认协议为http, 所以可以省略，按照下面的形式，也是可以的。
```
curl --proxy "user:pwd@127.0.0.1:1234" "http://httpbin.org/ip"
```

# 排查问题

curl -v参数会输出请求中访问的路由信息，方便确定是否设置成功，请求有没有代理  
netstat -nat | grep 1024 查看与代理端口相链接的端口   
lsof -i :1024 查看端口相关的进程  
 
