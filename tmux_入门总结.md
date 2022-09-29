```
//原创:
--------------------------
ssh user@host
#这里是主会话
sudo apt-get install tmux    //ubutu好像已经装了

tmux ls  //查看tmux会话,现在还没有tmux会话
tmux     //建立一个tmux会话,并且进入

# 注释: 已经在tmux 会话里面
# 注释: 可以输入任何 shell命令,执行任何操作,同主会话一样的.
# 输入: tmux试试,会报告说不能嵌套使用tmux

ctr+b d # 保留会话(session),退回到主会话,就是一开始登录的界面
exit    # 关闭会话,上面的命令选择一个

#现在回到刚登录的界面,主会话
tmux ls
tmux attach //返回 
exit
exit
-----------------
总结:
以下五个命令练习熟悉,就可以使用tmux,解决由于服务器链接不稳定,导致长时间的脚本任务失败

tmux ls
tmux
ctr+b d //先按ctrl+b  松开两个键后,单独按 d
tmux attach
exit

------------
原创
```
