
# tmux

# see:  
https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/  
https://segmentfault.com/a/1190000015143625  
https://www.ruanyifeng.com/blog/2019/10/tmux.html  

----

# 命令
助记符号, tmux命令的前导键  
C-b == ctrl+b  
C-b d 退出当前session  

会话命令:
tmux ls
tmux new -s session_name
tmux attach
tmux attach -t 0
tmux attach sessin_namec  
C-b d         保留并且退出当前session,  
              这里退出会话只是客户端退出会话,会话服务还在运行.  
exit / C-d    结束并且退出当前会话


