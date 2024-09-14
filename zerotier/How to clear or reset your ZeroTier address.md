- [How to clear or reset your ZeroTier address](https://docs.zerotier.com/faq/#reset-address)

# Step 1. Stop the service
On Windows

On Windows this is done with the service manager. (Open the Start Menu and start typing "service")
On macOS

On macOS you can open a terminal and use

sudo launchctl unload /Library/LaunchDaemons/com.zerotier.one.plist

On Linux

This is usually

sudo systemctl stop zerotier-one

or

sudo service zerotier-one stop

# Step 2. Delete the files identity.public and identity.secret from ZeroTier's working directory

    On Windows this is usually \ProgramData\ZeroTier\One
    On Mac this is /Library/Application Support/ZeroTier/One in your terminal, type open /Library/Application Support/ZeroTier/One to open the folder in Finder.
    On Linux this is usually /var/lib/zerotier-one

# Step 3. Restart the service
On Windows

Starting via the service manager on Windows
On Mac

sudo launchctl load /Library/LaunchDaemons/com.zerotier.one.plist

On Linux

sudo systemctl start zerotier-one

or

sudo service zerotier-one start

When started without identities ZeroTier will generate new ones. You will need to authorize this new identity on any networks.

# 总结：
 Delete the files identity.public and identity.secret and restart the service
