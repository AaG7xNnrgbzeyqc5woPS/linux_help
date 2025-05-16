# See：
 - [使用Privoxy将Sock5代理转换成HTTP代理](https://github.com/lujun9972/lujun9972.github.com/blob/source/linux%E5%92%8C%E5%AE%83%E7%9A%84%E5%B0%8F%E4%BC%99%E4%BC%B4/%E4%BD%BF%E7%94%A8Privoxy%E5%B0%86Sock5%E4%BB%A3%E7%90%86%E8%BD%AC%E6%8D%A2%E6%88%90HTTP%E4%BB%A3%E7%90%86.org)
 - [Privoxy - Home Page](https://www.privoxy.org/)
 - [Privoxy](https://wiki.archlinuxcn.org/wiki/Privoxy)
 - [privoxy的使用](https://ggqshr.github.io/2020-12-01/privoxy%E7%9A%84%E4%BD%BF%E7%94%A8/)

# privoxy
hadowsocks只支持SOCK5代理，然而大多数的软件（包括平板无线网络的代理设置）只支持HTTP代理，这就难搞了。
经过一番探查，发现一个名叫 [Privoxy](https://www.privoxy.org/) 的应用可以帮我们将SOCK5代理转换成HTTP代理。

1. 安装privoxy
```
sudo apt install -y privoxy
```        

2. 修改Privoxy配置

**使用Privoxy必须指定转发规则，Privoxy的主配置文件在/etc/privoxy/config**  
~~~Privoxy的配置文件路径为 /usr/privoxy/config~~~
我们需要修改里面的 listen-address 选项
```
listen-address  0.0.0.0:8118
```    

表示监听本机所有IP的8118端口

然后添加 forward-socks5 选项，比如我的socks5代理监听的是1080端口，那么
```
forward-socks5   /               127.0.0.1:1080 .
```    

重启Privoxy服务
```
sudo systemctl restart privoxy.service
```    

验证一把
```
curl -L --connect-timeout 2 -x 192.168.1.9:8118 https://google.com
```

    
