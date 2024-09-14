- [How to clear or reset your ZeroTier address](https://docs.zerotier.com/faq/#reset-address)

# Step 1. Stop the service
**On Windows**

On Windows this is done with the service manager. (Open the Start Menu and start typing "service")

**On macOS**

On macOS you can open a terminal and use

sudo launchctl unload /Library/LaunchDaemons/com.zerotier.one.plist

**On Linux**

This is usually

sudo systemctl stop zerotier-one

or

sudo service zerotier-one stop

# ❤️Step 2. Delete the files identity.public and identity.secret from ZeroTier's working directory

- On Windows this is usually \ProgramData\ZeroTier\One
- On Mac this is /Library/Application Support/ZeroTier/One in your terminal, type open /Library/Application Support/ZeroTier/One to open the folder in Finder.
- On Linux this is usually /var/lib/zerotier-one

- 注释： \ProgramData\ZeroTier\One 这是一个隐藏目录，需要选择显示隐藏目录。也可以使用文件夹的搜索功能，直接搜索 identity.public
- linux search command: find / -name 'identity.public'

# Step 3. Restart the service
**On Windows**

Starting via the service manager on Windows

**On Mac**

sudo launchctl load /Library/LaunchDaemons/com.zerotier.one.plist

**On Linux**

sudo systemctl start zerotier-one

or

sudo service zerotier-one start

When started without identities ZeroTier will generate new ones. You will need to authorize this new identity on any networks.

# 测试：
  1，使用 windows 10  zerotier-one,通过删除identity的方法，重新获得了ID,并且加入网络Ok，ping Ok
  2, 使用 linux, 按照教程再做一遍，也是Ok

# 总结：
 Delete the files identity.public and identity.secret and restart the service
