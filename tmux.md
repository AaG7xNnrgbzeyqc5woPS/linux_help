
# tmux

# see:  
https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/  
https://segmentfault.com/a/1190000015143625  
https://www.ruanyifeng.com/blog/2019/10/tmux.html  

----

# 命令

### 助记符号, tmux命令的前导键:  
C-b == ctrl+b  
C-b d 退出当前session  

### 会话命令:  
tmux ls  
tmux new -s session_name  
tmux attach  
tmux attach -t session_name    # attach target-session  
tmux rename-session -t 0 database  # rename session

C-b d         detach  保留并且退出当前session,  这里退出会话只是客户端退出会话,会话服务还在运行.  
exit / C-d    结束并且退出当前会话, exit



