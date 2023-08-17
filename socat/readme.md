# See: 
- [socat - Multipurpose relay - offical web ](http://www.dest-unreach.org/socat/)
- [Linux 中的 Socat 命令示例](https://www.51cto.com/article/717314.html)
- [Socat 入门教程](https://www.hi-linux.com/posts/61543.html)
- [用socat转发端口](https://fasionchan.com/network/toolkit/socat/)

# 例子一 基于网络的消息收集器
这个简单的例子演示了基于网络的消息收集器的实现。客户端连接到端口 3354 成功后，文件/tmp/testing.log通过新生成的子进程附加客户端发送的数据。当发现此文件不存在时， socat会自动创建此文件：
```
 sudo socat -u  TCP4-LISTEN:3354,reuseaddr,fork    OPEN:/tmp/testing.log,creat,append
```

# 例子二 TCP 端口转发器
它也是一个有效的TCP端口转发器。例如，端口81连接可以转发到端口80，如下所示：

对于单个连接：
```
$ sudo socat TCP4-LISTEN:81   TCP4:192.168.122.1:80
```
对于多个连接：
```
$ sudo socat TCP4-LISTEN:81,fork,reuseaddr  TCP4:TCP4:192.168.122.1:80
```
您可以使用键盘组合取消端口转发[Ctrl]+c。

# 例子三  监听特定端口

我们可以指示socat通过TCP协议监听特定端口，例如80 ，并通过STDOUT打印出任何相关的发现，如下所示：
```
$ sudo socat TCP4-LISTEN:80 STDOUT
```
TCP可以切换到其他不同的值，例如TCP6、TCP6-LISTEN和TCP4。

# 例子四 连接到远程服务器的端口

要连接到与端口关联的服务器，我们将运行：
```
$ sudo socat – TCP4:linuxmi.com:80 
```

# 例子五 监听本地端口

监听本地端口www：
```
$ sudo socat TCP4-LISTEN:www TCP4:linuxmi.com:www
```

# 例子六 监听远程套接字上的特定端口

如果我们想监听一个特定的端口，接受它的连接并将它转发到一个远程的 Unix 套接字，例如 mysql.sock，我们会以如下方式实现 socat 命令：
```
$ sudo socat TCP-LISTEN:3309,reuseaddr,fork UNIX-CONNECT:/var/lib/mysql/mysql.sock
```
