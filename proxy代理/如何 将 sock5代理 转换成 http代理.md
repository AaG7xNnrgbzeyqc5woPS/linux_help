<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 如何 将 sock5代理 转换成 http代理

将SOCKS5代理转换成HTTP代理，常用且简便的方法是使用开源代理工具**Privoxy**。具体步骤如下：

## 使用Privoxy将SOCKS5代理转换为HTTP代理的步骤

1. **下载并安装Privoxy**
根据操作系统，从Privoxy官网或软件仓库下载安装包并安装。
    - Linux系统可用命令安装：`sudo apt install privoxy`
    - Windows系统下载安装程序并安装[^1][^3][^4][^6][^7]。
2. **配置Privoxy**
找到Privoxy的配置文件：
    - Linux通常在 `/etc/privoxy/config`
    - Windows通常在 `C:\Program Files (x86)\Privoxy\config.txt`

用文本编辑器打开配置文件，添加或修改以下内容：

```
listen-address 127.0.0.1:8118
forward-socks5 / 127.0.0.1:1080 .
```

其中：
    - `listen-address` 是Privoxy监听的HTTP代理端口（这里是8118）
    - `forward-socks5 / 127.0.0.1:1080 .` 指定SOCKS5代理地址和端口（127.0.0.1:1080为示例，请替换成实际SOCKS5代理地址）
    - 末尾的点号 `.` 不可省略[^1][^3][^4][^5][^6][^7]。
3. **启动Privoxy服务**
    - Linux系统：

```
sudo systemctl restart privoxy
sudo systemctl enable privoxy  # 设置开机自启（可选）
```

    - Windows系统：双击 `privoxy.exe` 启动服务或通过命令行启动[^1][^3][^4][^7]。
4. **配置客户端使用HTTP代理**
设置HTTP代理地址为 `http://127.0.0.1:8118`，即可通过Privoxy转发到SOCKS5代理。
例如在Linux环境下设置环境变量：

```
export http_proxy='http://127.0.0.1:8118'
export https_proxy=$http_proxy
```

或在浏览器中设置HTTP代理为127.0.0.1端口8118[^1][^3][^4][^6]。

---

该方法利用Privoxy作为中间HTTP代理服务器，将HTTP请求转发到SOCKS5代理，实现协议转换，适用于客户端只支持HTTP代理的场景[^1][^3][^4][^5][^6][^7][^8]。

<div style="text-align: center">⁂</div>

[^1]: https://developer.aliyun.com/article/1105959

[^2]: https://github.com/lujun9972/lujun9972.github.com/blob/source/linux和它的小伙伴/使用Privoxy将Sock5代理转换成HTTP代理.org

[^3]: https://blog.csdn.net/surfirst/article/details/142381156

[^4]: https://blogtt.readthedocs.io/en/latest/tools/kxsw/privoxy-socks5-http-linux.html

[^5]: https://blog.csdn.net/Spiderzhaoyi/article/details/128239814

[^6]: https://www.jianshu.com/p/f6cacb8e8e75

[^7]: https://blogtt.readthedocs.io/en/latest/tools/kxsw/privoxy-socks5-http.html

[^8]: https://blog.nsfocus.net/https/

