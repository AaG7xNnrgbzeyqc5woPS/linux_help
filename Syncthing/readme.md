# See:
- [Syncthing Main Pages](https://syncthing.net/)
- [Syncthing Getting Started](https://docs.syncthing.net/intro/getting-started.html)
- [Welcome to Syncthing’s documentation!](https://docs.syncthing.net/)
- [Syncthing Downloads](https://syncthing.net/downloads/)

# Install at Untuntu 24.04 
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

# run

