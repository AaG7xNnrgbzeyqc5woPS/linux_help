<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# privoxy 类似的sock5 转 http代理有哪些呢？

除了Privoxy之外，市面上还有几款支持将SOCKS5代理转换为HTTP代理的工具，常用于类似场景：

## 1. Polipo

- Polipo是一个小巧的缓存HTTP代理服务器，支持将SOCKS5代理转换为HTTP代理。
- 通过配置`socksParentProxy=localhost:1080`（假设SOCKS5代理端口为1080）即可实现转换。
- 适合轻量级代理转换和缓存需求。
- 安装简单，命令如`apt-get install polipo`，配置文件中设置上游socks代理即可[^8]。


## 2. PProxy

- PProxy是一个多功能代理工具，支持多种代理协议的转换。
- 可以在同一端口同时提供多种代理类型，支持下游为SOCKS5，上游为HTTP代理，反向转换功能比Privoxy更灵活[^1]。
- 适合复杂代理链和多协议需求。


## 3. Privoxy

- 作为经典的HTTP代理过滤器，Privoxy本身支持将SOCKS5代理转为HTTP代理，通过配置`forward-socks5 / 127.0.0.1:1080 .`即可实现[^2][^3][^4][^7][^9]。
- 还能进行广告过滤、隐私保护等功能。


## 4. 其他工具（不常用或需组合使用）

- Squid虽然是强大的HTTP代理服务器，但不支持直接作为SOCKS5转HTTP代理的上游。
- Shadowsocks本身是SOCKS5代理，不提供HTTP代理接口，通常与Privoxy或Polipo等工具配合使用实现转换[^8][^10]。

---

### 总结

| 工具名称 | 功能描述 | 是否支持SOCKS5转HTTP | 额外特点 |
| :-- | :-- | :-- | :-- |
| Privoxy | HTTP代理过滤器，支持转发 | 支持 | 广告过滤，隐私保护 |
| Polipo | 轻量级HTTP代理缓存 | 支持 | 缓存功能，配置简单 |
| PProxy | 多协议代理转换工具 | 支持 | 多协议混合，灵活转换 |
| Shadowsocks | SOCKS5代理工具 | 不支持直接转HTTP | 需配合Privoxy等工具使用 |
| Squid | 强大HTTP代理服务器 | 不支持SOCKS5转HTTP | 缓存和访问控制 |

因此，除了Privoxy，**Polipo**和**PProxy**是常见且实用的SOCKS5转HTTP代理工具，适合不同场景需求。Privoxy因其过滤功能和配置灵活性仍是最受欢迎的选择之一[^1][^3][^4][^7][^8]。

<div style="text-align: center">⁂</div>

[^1]: https://blog.nsfocus.net/https/

[^2]: https://ggqshr.github.io/2020-12-01/privoxy的使用/

[^3]: https://blog.csdn.net/surfirst/article/details/142381156

[^4]: https://blog.phpgao.com/privoxy-shadowsocks.html

[^5]: https://www.cnblogs.com/candlia/p/11919900.html

[^6]: https://github.com/vicnoah/docker-sslocal-privoxy

[^7]: https://wayjam.me/posts/forward-socks-to-http-proxy/

[^8]: http://tiven.wang/articles/setup-shadowsocks-proxy-using-docker/

[^9]: https://infras.cn/articles/1233

[^10]: https://qhh0205.github.io/2018/05/20/Shadowsocks-Privoxy-搭建-http-代理服务/

[^11]: https://blog.csdn.net/summer_lele/article/details/136175416

[^12]: https://github.com/ssoor/socks

[^13]: https://gist.github.com/taoyuan/1e1c976e4ff1663f3aba6ab9a7df6862

[^14]: https://hub.docker.com/r/oldiy/ss-privoxy

[^15]: https://chenjiehua.me/linux/socks5_and_http_proxy.html

[^16]: https://www.cnblogs.com/lirunzhou/p/10248727.html

[^17]: https://sulian-blog.com/shadowsocks-v2ray-local-proxy-docker/

[^18]: https://blogtt.readthedocs.io/en/latest/tools/kxsw/privoxy-socks5-http-linux.html

[^19]: https://blog.csdn.net/yyws2039725/article/details/90615740

[^20]: https://runsisi.com/2019/04/03/socks-to-http/

