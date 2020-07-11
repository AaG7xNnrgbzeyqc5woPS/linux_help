see:  [Enable snaps on Manjaro Linux]( https://snapcraft.io/install/indicator-sensors/manjaro)

# 1. Enable snaps on Manjaro Linux

Snaps are applications packaged with all their dependencies to run on all popular Linux distributions from a single build. They update automatically and roll back gracefully.  

Snaps are discoverable and installable from the Snap Store, an app store with an audience of millions.  
Enable snapd

Snapd can be installed from Manjaro’s Add/Remove Software application (Pamac), found in the launch menu. From the application, search for snapd, select the result, and click Apply.  

Alternatively, snapd can be installed from the command line:  

Once installed, the systemd unit that manages the main snap communication socket needs to be enabled:  

To enable classic snap support, enter the following to create a symbolic link between /var/lib/snapd/snap and /snap:  

Either log out and back in again, or restart your system, to ensure snap’s paths are updated correctly.  
