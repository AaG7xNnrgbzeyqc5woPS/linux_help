#安装常用软件

yaourt -Sy --noconfirm netease-cloud-music smplayer smplayer-skins smplayer-themes google-chrome sublime-text-dev-zh-cn masterpdfeditor remarkable uget filezilla shadowsocks-qt5 deepin-screenshot shutter

netease-cloud-music 网易云音乐；
smplayer 视频播放器；
google-chrome 谷歌浏览器；
notepadqq 像notepad++文本编辑；
sublime-text-dev-zh-cn 强大的开发必备文本编辑器；(有能力采用付费许可证)
masterpdfeditor 对linux用户免费的PDF浏览及编辑器，支持实时预览；
remarkable 卓越且功能齐全的 Markdown 编辑器；
uget 媲美迅雷的下载工具；
filezilla 强大的FTP工具；
shadowsocks-qt5 翻墙工具，配合浏览器插件SwitchyOmega使用；
deepin-screenshot 深度截图工具；
shutter 强大的截图工具，gnome-web-photo配合使用；
variety 随即更换壁纸的应用；
ccal 终端农历日历，终端启动ccal；

yaourt -Sy --noconfirm bleachbit redshift 

bleachbit 快速释放磁盘空间并不知疲倦地守卫你的隐私。释放缓存，删除 cookie，清除互联网浏览历史，清理临时文件，删除日志，以及更多功能...
i-nex 小而全的系统信息查看软件；
redshift 根据你的周边调整你屏幕的色温。当你夜晚在屏幕前工作时，它也许能帮助你减少对眼睛的伤害；

yaourt -Sy --noconfirm keepassx-git screenfetch-git freefilesync #需要网络git

keepassx-git 密码管理器；
screenfetch-git  系统信息工具，终端使用screenfetch命令；
freefilesync 文件夹比较和同步工具；

 

#生产力

yaourt -Sy --noconfirm wiznote meld goldendict easystroke catfish peek

wiznote 为知笔记；
meld 文本比较；
goldendict 词典软件；
easystroke 鼠标手势；
catfish 基于GTK+的非常快速，轻量级的文件搜索工具；
peek 屏幕录像工具，小巧玲珑，可保存录像为gif动图和兼容于html5的webm视频；

yaourt -Sy --noconfirm xmind  #需要网络

xmind 跨平台的思维导图工具，关键还是可以导入MindManage的文件；

 

#编程开发

yaourt -Sy --noconfirm eclipse-jee jetbrains-toolbox openjdk8-doc openjdk8-src dbeaver dbeaver-plugin-apache-poi dbeaver-plugin-batik dbeaver-plugin-office 

eclipse-jee 企业Java 集成开发环境；
jetbrains-toolbox 著名的jetbrains序列的IDE管理工具；
openjdk8-doc openjdk8-src 针对OpenJDK8的文档和源码；
dbeaver 通用数据库客户端，支持多个平台及多种数据库，社区版是免费的； 

yaourt -Sy --noconfirm codeblocks qtcreator glade glade-gtk2 kompozer kompozer-i18n-zh-cn

codeblocks 跨平台的C++ IDE，官方网站上称其能满足最苛刻的用户的需求。'
qtcreator 基于QT的C++开发工具（包括界面设计）；
glade基于GTK3 的C++开发工具（包括界面设计）；
glade-gtk2基于GTK2 的C++开发工具（包括界面设计）；
kompozer 类似Dreamweaver所见即所得功能的开源HTML编辑器。

 

yaourt -Sy --noconfirm soapui #需要网络

 

yaourt -Sy --noconfirm nginx tomcat8 zookeeper

dbeaver 通用数据库客户端，支持多个平台及多种数据库，社区版是免费的；
nginx 终端执行 sudo nginx 启动，sudo nginx -s stop/realod 停止或重启；
tomcat8 开发必备，轻量的应用服务器；
zookeeper 终端执行sudo zkServer.sh start 启动；

 

#有意思

yaourt -Sy --noconfirm cmatrix geogebra stellarium celestia

cmatrix 终端从上往下输出无尽的字符串,类似<<黑客帝国>>中的矩阵效果，终端运行 cmatrix ；
geogebra 图形计算器，支持函数，几何，代数，微积分，统计以及 3D 数学。
stellarium 星象软件。可调选项很多，这是随便开起来截图的。
celestia 免费的空间模拟器，让你在三维空间中探索我们的宇宙;
gnucash 开源免费的个人或小型企业财务软件；
gramps 家谱软件；

 

#游戏

yaourt -Sy --noconfirm nethack gnome-mines 2048-qt zaz

nethack 经典的命令行游戏，启动命令行nethack；
gnome-mines 经典的扫雷游戏（gnome桌面自带，kde也有类似的kmines）；
2048-qt 经典的2048游戏；
zaz 经典的泡泡射击游戏；

yaourt -Sy --noconfirm sudokuki wesnoth wesnoth-data 0ad

sudokuki 基于Java的跨平台的数独游戏（https://sourceforge.net/projects/sudokuki/files/sudokuki/）；
wesnoth 经典的韦诺之战，Linux上比较火的游戏，回合制策略游戏；
0ad 跨平台的“帝国时代”（http://sourceforge.net/projects/zero-ad/files/releases/locales/下载对应版本的汉化放到$HOME/.local/share/0ad/mods/public/）；

 

#虚拟机（全面更新系统重启后最后安装）

sudo pacman -Sy virtualbox linux414-virtualbox-host-modules virtualbox-ext-oracle

virtualbox 虚拟机工具，linux首选，比vmware还好用。

    https://wiki.manjaro.org/index.php?title=Virtualbox
linux414-virtualbox-host-modules  根据安装的内核版本选择，比如有 uname -r 如果是4.14内核，则安装 linux414-virtualbox-host-modules ；
------------
参考：
https://my.oschina.net/langxSpirit/blog/1647000
