# See: 
- [Linux 中的 Socat 命令示例](https://www.51cto.com/article/717314.html)
- [Socat 入门教程](https://www.hi-linux.com/posts/61543.html)
- [用socat转发端口](https://fasionchan.com/network/toolkit/socat/)

# 例子一：
基于网络的消息收集器
这个简单的例子演示了基于网络的消息收集器的实现。客户端连接到端口 3354 成功后，文件/tmp/testing.log通过新生成的子进程附加客户端发送的数据。当发现此文件不存在时， socat会自动创建此文件：
```
 sudo socat -u  TCP4-LISTEN:3354,reuseaddr,fork    OPEN:/tmp/testing.log,creat,append
```
