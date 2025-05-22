<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# curl --socks5 10.147.19.21:9889 https://www.google.com/ 无返回

When running the command:

```bash
curl --socks5 10.147.19.21:9889 https://www.google.com/
```

and getting no response (no output, no error), the most common reasons and solutions are as follows:

## 1. Use `--socks5-hostname` Instead of `--socks5`

The option `--socks5` makes curl resolve the hostname (here, `www.google.com`) locally before sending the request through the SOCKS5 proxy. If the proxy expects to handle DNS resolution, this can cause the request to hang or fail silently.

Switching to:

```bash
curl --socks5-hostname 10.147.19.21:9889 https://www.google.com/
```

tells curl to let the SOCKS5 proxy resolve the hostname instead, which often fixes connection issues with SOCKS5 proxies[^2][^6][^7].

## 2. Verify Proxy Server Accessibility and Address

- Double-check that the proxy IP `10.147.19.21` and port `9889` are correct and that the proxy server is running and reachable from your machine.
- Test connectivity to the proxy with tools like `ping` or `telnet`:

```bash
ping 10.147.19.21
telnet 10.147.19.21 9889
```

If these fail, the proxy is unreachable or blocked by firewall rules[^3][^5].

## 3. Check for Authentication Requirements

If the SOCKS5 proxy requires username/password authentication, you must provide it with curl using:

```bash
curl --socks5-user username:password --socks5 10.147.19.21:9889 https://www.google.com/
```

Lack of authentication when required can cause silent failures or connection refusals[^3][^5].

## 4. Confirm curl Version and Syntax

- Ensure your curl version supports SOCKS5 proxies properly by running:

```bash
curl --version
```

- Use the correct syntax for specifying the proxy, preferably with `--proxy` option as:

```bash
curl --proxy socks5h://10.147.19.21:9889 https://www.google.com/
```

Note the `socks5h://` prefix which is equivalent to `--socks5-hostname` and instructs curl to let the proxy handle DNS resolution[^2][^6].

## 5. Network and Firewall Settings

- Check if any firewall or network security settings on your client or proxy server block the connection.
- Temporarily disable firewalls or adjust rules to allow traffic on port 9889.


## Summary

Your command returns no response likely because curl is resolving DNS locally with `--socks5`, which may not be supported or expected by your SOCKS5 proxy. Changing to `--socks5-hostname` or using `--proxy socks5h://` instructs curl to let the proxy handle DNS, typically resolving the issue.

Try this command:

```bash
curl --socks5-hostname 10.147.19.21:9889 https://www.google.com/
```

If that still fails, verify proxy reachability, authentication, and network/firewall settings as described above[^2][^3][^5][^6][^7].

<div style="text-align: center">⁂</div>

[^1]: www.google.com

[^2]: https://stackoverflow.com/questions/24568788/doing-https-requests-through-a-socks5-proxy-tor-with-curl

[^3]: https://www.pyproxy.com/information/how-to-debug-common-errors-of-socks5-proxy-connection-using-curl.html

[^4]: https://apple.stackexchange.com/questions/373585/socks-proxy-environment-variable-ignored-by-command-line-applications

[^5]: https://www.pyproxy.com/information/how-to-resolve-the-“connection-refused”-error-when-configuring-the-socks5-proxy-with-curl.html

[^6]: https://curl.se/mail/archive-2019-08/0020.html

[^7]: https://www.youtube.com/watch?v=K1AwjiLuoMg

[^8]: https://everything.curl.dev/usingcurl/proxies/socks.html

[^9]: https://unix.stackexchange.com/questions/49280/curl-socks5-proxy-empty-reply-from-server

[^10]: https://serverfault.com/questions/963436/curl-socks5-escape-authentification-data

[^11]: https://curl-users.cool.haxx.narkive.com/WqtDLSkR/curl-7-16-1-socks5-seems-not-to-work

[^12]: https://stackoverflow.com/questions/73798733/why-socks5-protocol-in-http-proxy-lead-curl-52-empty-reply-from-server

[^13]: https://github.com/curl/curl/issues/10537

[^14]: https://stackoverflow.com/questions/14625126/curl-not-working-with-http-socks-proxy-on-a-live-server

[^15]: https://scrapingant.com/blog/curl-with-proxy

[^16]: https://github.com/curl/curl/issues/5053

[^17]: https://www.piaproxy.com/blog/Socks5/how-to-use-curl-to-make-web-requests-on-socks5-proxy-a-guide-from-basic-to-advanced.html

[^18]: https://curl.se/mail/archive-2019-08/0017.html

