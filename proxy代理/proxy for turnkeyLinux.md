# 0. See:
- [Configure apt-get internet access via a proxy ](https://www.turnkeylinux.org/docs/config-apt-get-proxy)
- [TurnKey Documentation](https://www.turnkeylinux.org/docs)
- ❤️[Confconsole - TurnKey Linux Configuration Console ](https://www.turnkeylinux.org/docs/confconsole)


# 1. Copy
If you are using TKL behind a corporate firewall that requires a proxy to get to the outside world then you'll need to configure apt-get to use a proxy (for installing software via package management, including auto security updates).

It's pretty easy. Just add the apt config using your favourite text editor (instructions for nano but use vim or whatever if you prefer).

```
nano /etc/apt/apt.conf.d/01turnkey
```
then insert:
```
Acquire::http::Proxy "http://your.proxy.here:port/";
```
If your proxy requires a username and password, then prefix that to the proxy domain, like this:
```
Acquire::http::Proxy "http://user:password@your.proxy.here:port/";
```


Save and exit and you're done! Check that it works with:
```
apt-get update
```
If everything works as it should then the command should complete successfully.


# 2. 使用 confconsole命令
- ❤️[Confconsole - TurnKey Linux Configuration Console ](https://www.turnkeylinux.org/docs/confconsole)
- 高级部分可以设在http proxy
