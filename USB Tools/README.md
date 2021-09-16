- 介绍几种常用USB盘的制作工具，有的可以直接制作可以启动盘

# 0. See:
 -[ balena-io/etcher ](https://github.com/balena-io/etcher)
 -[ pbatard/rufus ](https://github.com/pbatard/rufus)
 -[ ventoy/Ventoy ](https://github.com/ventoy/Ventoy)
 -[USB device boot mode](https://www.raspberrypi.org/documentation/computers/raspberry-pi.html)
 

# 1. etcher
  Etcher

    Flash OS images to SD cards & USB drives, safely and easily.

Etcher is a powerful OS image flasher built with web technologies to ensure flashing an SDCard or USB drive is a pleasant and safe experience. It protects you from accidentally writing to your hard-drives, ensures every byte of data was written correctly, and much more. It can also directly flash Raspberry Pi devices that support USB device boot mode.

# 2. Rufus: The Reliable USB Formatting Utility

Rufus is a utility that helps format and create bootable USB flash drives.
Features

    Format USB, flash card and virtual drives to FAT/FAT32/NTFS/UDF/exFAT/ReFS/ext2/ext3
    Create DOS bootable USB drives, using FreeDOS or MS-DOS (Windows 8.1 or earlier)
    Create BIOS or UEFI bootable drives, including UEFI bootable NTFS
    Create bootable drives from bootable ISOs (Windows, Linux, etc.)
    Create bootable drives from bootable disk images, including compressed ones
    Create Windows To Go drives
    Create persistent Linux partitions
    Download official Microsoft Windows 7, Windows 8 or Windows 10 retail ISOs
    Download UEFI Shell ISOs
    Compute MD5, SHA-1, SHA-256 and SHA-512 checksums of the selected image
    Twice as fast as Microsoft's USB/DVD tool or UNetbootin, on ISO → USB creation (1)
    Perform bad blocks checks, including detection of "fake" flash drives
    Modern and familiar UI, with 38 languages natively supported
    Small footprint. No installation required.
    Portable
    100% Free Software (GPL v3)

# 3. Ventoy
Ventoy is an open source tool to create bootable USB drive for ISO/WIM/IMG/VHD(x)/EFI files.
With ventoy, you don't need to format the disk over and over, you just need to copy the image files to the USB drive and boot it. You can copy many image files at a time and ventoy will give you a boot menu to select them.
x86 Legacy BIOS, IA32 UEFI, x86_64 UEFI, ARM64 UEFI and MIPS64EL UEFI are supported in the same way.
Both MBR and GPT partition style are supported in the same way.
Most type of OS supported(Windows/WinPE/Linux/Unix/ChromeOS/Vmware/Xen...)
730+ ISO files are tested (List). 90%+ distros in distrowatch.com supported (Details). 
