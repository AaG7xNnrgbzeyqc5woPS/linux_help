# 参考
useradd 与adduser的区别
https://blog.csdn.net/li_101357/article/details/46778827

Linux 中useradd与adduser的区别
https://blog.csdn.net/qq_32846595/article/details/60583409


--------------------------
# useradd adduser 区别
1. useradd是一个linux命令，但是它提供了很多参数在用户使用的时候根据自己的需要进行设置；
2. adduser是一个perl 脚本，在使用的时候会出现类似人机交互的界面，提供选项让用户填写和选择
   推荐使用 adduser
   
-----------------
# useradd 
useradd 有两个参数最重要
 -m 创建 家目录
 -s shell 指定shell
 
 ---------------- 
 # 删除用户 
 *  userdel -r 用户名
 
  只需使用一个简单的命令“userdel 用户名”即可。不过最好将它留在系统上的文件也删除掉，
  你可以使用“userdel -r 用户名”来实现这一目的。 
