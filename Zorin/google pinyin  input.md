# See:
- [Install Google Pinyin input method on Ubuntu/Debian](https://mrzhubin.wordpress.com/2019/09/20/install-google-pinyin-input-method-on-debian/)

# install and setup for google pinyin input method

```

    Login as root (This is important, don’t do it with non-root user)
    Run the following command, scroll all the way down to add Chinese locales, e.g. zh_CN.UTF-8 etc.

    dpkg-reconfigure locales

    Run the following command to install the required packages

    apt install fcitx fcitx-pinyin fcitx-googlepinyin

    Run “im-config” and change it to “fcitx”, reboot the server
    Run “fcitx-configtool” after login, click “+” button to add new input method. In the popup selection box uncheck “Only Show Current Language” and then search for “google” to add Google Pinyin”.
    In “Global Config” tab, choose the shortcut keys for switching input methods and also add Google Pinyin input method
```
#  note:
 最后一步，"fcitx-configtool" 必须使用普通用户，不能用root用户，否则看不到 new input method,找不到google pinyin 输入法
 
 # 测试：
 根据上面的提示，已经在 Zorin OS 16.1 上安装成功！Good Job!
 ```
  lsb_release -a
No LSB modules are available.
Distributor ID:	Zorin
Description:	Zorin OS 16.1
Release:	16
Codename:	focal

 ```
