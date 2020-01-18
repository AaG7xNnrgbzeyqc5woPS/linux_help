[使用axel多线程疯狂下载](https://www.linuxprobe.com/axel-use.html)

简略使用."-n"线程数、"-o"下载保存目录、"-a"简略下载条。我们以下载wps for linux的64位rpm为例，正常下载速度在30k左右。用axel开20个下载呢:

axel -n 20 -a -o /home/ http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office-10.1.0.6757-1.x86_64.rpm

axel的参数也非常简单大概就是这些，有需要可以执行man axel看看

--max-speed=x           -s x    最大速度 (字节/秒)
 --num-connections=x     -n x    最大连接数 
--output=f              -o f    指定文件名 
--search[=x]            -S [x]  Search for mirrors and download from x servers 
--header=x              -H x    添加header 
--user-agent=x          -U x    设置用户代理 
--no-proxy              -N      不使用任何代理 
--quiet                 -q      Leave stdout alone
--verbose               -v      显示更多状态信息 
--alternate             -a      显示简单进度条 
--help                  -h      帮助 
--version               -V      版本信息
