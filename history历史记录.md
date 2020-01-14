

# see:
[linux如何查看/清空历史记录](https://jingyan.baidu.com/article/17bd8e524dc9a185aa2bb844.html)


# 历史记录命令:
$history  //查看当前用户的历史记录
$cat ~/.bash_history  历史记录保存在本文件中,删除这个文件就可以删除历史记录,每次打开bash,bash都会从这个文件读取历史记录

$history -c //清除历史记录缓冲区
$history  //显示历史记录缓冲区的记录
$history -w //当前的历史记录缓冲区马上写入 ~/.bash_history, 并且冲掉其中的原先记录

#rm -f ~/.bash_history  //删除历史记录文件

