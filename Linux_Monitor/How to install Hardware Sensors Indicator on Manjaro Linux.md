see:
 [How to install Hardware Sensors Indicator on Manjaro Linux](https://snapcraft.io/install/indicator-sensors/manjaro)
 [lm_sensors](https://wiki.archlinux.org/index.php/Lm_sensors)
 
 # 1. lm_sensors
    sudo pacman -S lm_sensors hddtemp
 
    lsblk
    sudo hddtemp /dev/sda
    sudo hddtemp /dev/nvme0n1
    ls /dev/nvme0n1
 
    sudo sensors-detect
    
    sensors
    
 

