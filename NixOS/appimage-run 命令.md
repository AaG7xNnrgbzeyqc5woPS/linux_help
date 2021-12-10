# 0. See:
  - [appimage-run package](https://search.nixos.org/packages?channel=21.05&from=0&size=50&sort=relevance&type=packages&query=appimage-run)


# 1. 启动AppImage程序
- cd AppImage目录
- appimage-run ledger-live-desktop-2.35.2-linux-x86_64.AppImage

# 2. AppImage-run 命令
- appimage-run  显示命令行帮助
- appimage-run -h 显示命令行帮助
- ❤️不需要特权就能运行程序，不需要 sudo
```$ appimage-run
realpath: '': No such file or directory
Usage: appimage-run [appimage-run options] <AppImage> [AppImage options]

-h      show this message
-d      debug mode
-x      <directory> : extract appimage in the directory then exit.
-w      <directory> : run uncompressed appimage directory (used in appimageTools)

[AppImage options]: Options are passed on to the appimage.
If you want to execute a custom command in the appimage's environment, set the APPIMAGE_DEBUG_EXEC environment variable.


```
