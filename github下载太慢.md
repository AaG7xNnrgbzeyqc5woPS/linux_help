
[解决GitHub下载速度太慢的问题](https://blog.csdn.net/qing666888/article/details/79123742)  
[github访问慢和clone慢解决方案](https://blog.csdn.net/ITleaks/article/details/80351680)  


'''
授人以鱼(解决方案)

    
 ubuntu修改/etc/hosts(windows下C:\Windows\System32\drivers\etc\HOST)文件添加如下ip隐射
192.30.253.113 github.com
授人以渔(解决方法)

ItleaksdeMacBook-Pro:projects itleaks$ nslookup github.com
Server:        192.168.8.1
Address:    192.168.8.1#53

Non-authoritative answer:
Name:    github.com
Address: 13.250.177.223
Name:    github.com
Address: 52.74.223.119
Name:    github.com
Address: 13.229.188.59
    上面可以看出这个域名有多个address,那说明该域名使用了CDN
    通过修改/etc/hosts文件一个一个测试上面的三个ip地址，发现这三个ip速度都很慢。其实github应该还有很多其他ip的，只不过我的电脑最近的dns服务器只返回它维护的三个ip,如果从其他城市访问github.com就可能得到不一样的ip。因而，我们需要模拟其他地点的访问以拿到github.com的其他ip。这个通过http://tool.chinaz.com/dns/工具可做到, 该工具在各地都有服务器，可以实现各地请求这个域名，然后显示返回的ip
————————————————
版权声明：本文为CSDN博主「区块链斜杠青年」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/ITleaks/article/details/80351680
'''
