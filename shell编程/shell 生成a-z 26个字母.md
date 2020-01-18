

[生成a-z 26个字母](https://my.oschina.net/guonaihong/blog/499877)
有时候写代码会有写26个字母的需要(abcdefghijklmnopqrstuvwxyz)

首先想到的方法是把键盘里的字母敲一遍，这个方式不仅繁琐，而且容易出错。

其实只要用echo 命令就可以了。

生成a-z的字符：

echo {a..z}|tr -d ' '

生成0-9的字符

echo {0..9}|tr -d ' '
