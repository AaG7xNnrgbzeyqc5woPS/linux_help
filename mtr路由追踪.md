# 参看:
mtr命令 – 网络诊断  
https://www.linuxcool.com/mtr  


每天学习一个命令: mtr 查看路由网络连通性   
http://einverne.github.io/post/2017/11/mtr-usage.html  


# 1. 简介
    常用的 ping，tracert，nslookup 一般用来判断主机的网络连通性，
    其实 Linux 下有一个更好用的网络联通性判断工具，
    它可以结合ping nslookup tracert 来判断网络的相关特性，这个命令就是 mtr。
    mtr 全称 my traceroute，是一个把 ping 和 traceroute 合并到一个程序的网络诊断工具。 

    traceroute默认使用UDP数据包探测，而mtr默认使用ICMP报文探测，
    ICMP在某些路由节点的优先级要比其他数据包低，所以测试得到的数据可能低于实际情况。
    
# 2. traceroute
# 3. ping 
# 4. nslookup
