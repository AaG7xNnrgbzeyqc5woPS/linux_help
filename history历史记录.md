

# see:
1. [linux如何查看/清空历史记录](https://jingyan.baidu.com/article/17bd8e524dc9a185aa2bb844.html)  
2. [How to effectively clear your bash history](https://www.techrepublic.com/article/how-to-effectively-clear-your-bash-history/)
3. [How to clear bash history completely?](https://askubuntu.com/questions/191999/how-to-clear-bash-history-completely)
4. [How To Clear Shell History In Ubuntu Linux](https://www.cyberciti.biz/faq/clear-the-shell-history-in-ubuntu-linux/)

```
# 历史记录命令:
$history  //查看当前用户的历史记录
$cat ~/.bash_history  历史记录保存在本文件中,删除这个文件就可以删除历史记录,每次打开bash,bash都会从这个文件读取历史记录

$history -c //清除历史记录缓冲区
$history  //显示历史记录缓冲区的记录
$history -w //当前的历史记录缓冲区马上写入 ~/.bash_history, 并且冲掉其中的原先记录

$rm -f ~/.bash_history  //删除历史记录文件


$cat /dev/null > ~/.bash_history && history -c && exit

$echo "$HISTFILE"  //查看历史记录的名字
/home/pi/.bash_history

echo "$HISTSIZE"
1000

You can add the command to your ~/.bash_logout so that history will get cleared when you logout:
echo 'history -c' >> ~/.bash_logout


For more info read bash command man page online or offline by typing the following command:
man bash
help history

```
