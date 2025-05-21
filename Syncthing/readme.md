# 0. See:
- [Syncthing Main Pages](https://syncthing.net/)
- [Syncthing Getting Started](https://docs.syncthing.net/intro/getting-started.html)
- [Welcome to Syncthing’s documentation!](https://docs.syncthing.net/)
- [Syncthing Downloads](https://syncthing.net/downloads/)

# 1. Install at Untuntu 24.04 
  - [install Guide](https://apt.syncthing.net/)
  - 

To allow the system to check the packages authenticity, you need to provide the release key.
```
# Add the release PGP keys:
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
```
The stable channel is updated with stable release builds, usually every first Tuesday of the month.
```
# Add the "stable" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
```
The candidate channel is updated with release candidate builds, usually every second Tuesday of the month. These predate the corresponding stable builds by about three weeks.
```
# Add the "candidate" channel to your APT sources:
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
```
And finally.
```
# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
```

# 2. run
- [Getting Started](https://docs.syncthing.net/intro/getting-started.html#)
ssh登录ubuntu 24.04
方法一：
```
> syncthing
```

方法二：
```
syncthing  --gui-address=0.0.0.0:8384
syncthing  serve --gui-address=192.168.2.12:8384
runuser -l syncthing -c  'syncthing  serve --gui-address=192.168.2.12:8384'
runuser -l syncthing -c  'syncthing  serve'
```
# 3. Configuring
1. The admin GUI starts automatically and remains available on http://localhost:8384/. Cookies are essential to the correct functioning of the GUI; please ensure your browser accepts them. 
2. 根据配置的gui-address接口参数，使用 客户端电脑上的浏览器,打开syncthing服务器上的gui,  http://192.168.2.12:8384/

