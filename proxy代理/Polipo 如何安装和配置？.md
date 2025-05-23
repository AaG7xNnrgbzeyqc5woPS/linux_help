<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Polipo 如何安装和配置？

Polipo 是一个轻量级的带缓存功能的 HTTP 代理服务器，常用于将 SOCKS 代理转换为 HTTP 代理。下面是 Polipo 在 Linux（尤其是 Ubuntu/Debian 系统）上的安装和配置步骤：

## 安装 Polipo

在 Ubuntu、Debian、Mint、Kali 等基于 Debian 的系统上，可以使用 apt 命令直接安装：

```bash
sudo apt-get update
sudo apt-get install polipo
```

或者在基于 RedHat 的系统上使用 yum：

```bash
sudo yum install polipo
```

安装完成后，Polipo 的配置文件通常位于 `/etc/polipo/config` 或 `/etc/polipo/polipo` 目录下[^1][^2][^4][^5]。

## 配置 Polipo

1. **编辑配置文件**

打开配置文件进行编辑：

```bash
sudo vim /etc/polipo/config
```

2. **常用配置项示例**

```conf
# 监听所有网络接口的IPv4地址
proxyAddress = "0.0.0.0"

# 监听端口，默认是8123
proxyPort = 8123

# 允许访问代理的客户端IP段，例如局域网地址
allowedClients = 192.168.1.0/24

# 将 SOCKS5 代理转为 HTTP 代理
socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5

# 是否后台运行
daemonise = true

# 进程ID文件和日志文件路径
pidFile = /var/run/polipo.pid
logFile = /var/log/polipo.log

# 禁用IPv6 DNS查询（根据需要）
dnsQueryIPv6 = no
```

以上配置将 Polipo 设置为监听所有 IPv4 地址的 8123 端口，将本地的 SOCKS5 代理（127.0.0.1:1080）转为 HTTP 代理[^1][^4][^7][^8]。
3. **允许访问的客户端**

通过 `allowedClients` 指定允许使用代理的 IP 范围，防止外部未授权访问。
4. **缓存目录**

默认情况下，Polipo 会在 `/var/cache/polipo` 目录存储缓存文件。确保该目录存在且 Polipo 有写权限。

## 启动和管理 Polipo 服务

- 启动 Polipo：

```bash
sudo systemctl start polipo
```

- 设置开机自启：

```bash
sudo systemctl enable polipo
```

- 查看状态：

```bash
sudo systemctl status polipo
```

- 如果没有 systemd，可以直接运行：

```bash
sudo polipo
```

或者后台运行：

```bash
nohup polipo &
```

- 重启服务：

```bash
sudo systemctl restart polipo
```

或者：

```bash
sudo killall polipo
sleep 1
sudo polipo
```


## 使用代理

配置浏览器或系统代理，将 HTTP 和 HTTPS 代理地址设置为 Polipo 监听的 IP 和端口（默认是 `127.0.0.1:8123` 或配置文件中指定的地址端口）[^4][^7][^8]。

## 其他

- 查看所有支持的配置选项：

```bash
sudo polipo -v
```

- Polipo 支持通过 Web 界面查看状态和配置，默认地址为：

```
http://127.0.0.1:8123/polipo/status?
```

- Polipo 也可以配合 Privoxy 使用，实现更复杂的过滤和代理策略[^6]。

---

综上，Polipo 的安装和配置流程主要包括使用包管理器安装，编辑 `/etc/polipo/config` 配置文件设置监听地址、端口、上游 SOCKS 代理等参数，启动服务并设置开机自启，最后在客户端配置代理即可使用[^1][^2][^4][^7][^8]。

<div style="text-align: center">⁂</div>

[^1]: https://blog.csdn.net/cunjiu9486/article/details/109077047

[^2]: https://github.com/Chunlin-Li/Chunlin-Li.github.io/blob/master/blogs/linux/polipo.md

[^3]: https://blog.wjc66.cn/polipo、privoxy实现 Linux 系统全局自动代理/

[^4]: https://blog.csdn.net/weixin_34179968/article/details/93095793

[^5]: https://blog.gmem.cc/polipo-under-ubuntu

[^6]: https://wiki.archlinuxcn.org/wiki/Polipo

[^7]: https://www.cnblogs.com/k4nz/p/14261533.html

[^8]: https://gist.github.com/TaceyWong/ddb60a96e79ae195c9b7e33397241b88

[^9]: https://www.igfw.net/archives/282

[^10]: https://neucrack.com/p/275

