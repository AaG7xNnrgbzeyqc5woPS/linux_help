
# See:
[shell循环：for、while、until——详解](https://blog.51cto.com/12105235/2090749)
请看原文,以下仅仅做为备份

```
循环执行 ：将某代码段重复运行多次； 重复运行多少次： 循环次数事先已知 ；循环次数事先未知 ；有进入条件和退出条件。

三种循环体：for、while、until。

再循环前前介绍步进，在循环中经常用到步进。

步进

显示1-10

[root@centos6mini app]# echo {1..10}
1 2 3 4 5 6 7 8 9 10
[root@centos6mini app]# echo $(seq 1 10)
1 2 3 4 5 6 7 8 9 10

1-10 递加

[root@centos6mini app]# echo {1..10..2}
1 3 5 7 9
[root@centos6mini app]# echo $(seq 1 2 10)
1 3 5 7 9

1-10 递减

[root@centos6mini app]# echo {10..1..2}
10 8 6 4 2
[root@centos6mini app]# echo $(seq 10 -2 1)
10 8 6 4 2

1-100间的奇数和偶数

[root@centos6mini app]# echo {1..100..2}
1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83 85 87 89 91 93 95 97 99
[root@centos6mini app]# echo {2..100..2}
2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82 84 86 88 90 92 94 96 98 100
[root@centos6mini app]# echo {100..1..2}
100 98 96 94 92 90 88 86 84 82 80 78 76 74 72 70 68 66 64 62 60 58 56 54 52 50 48 46 44 42 40 38 36 34 32 30 28 26 24 22 20 18 16 14 12 10 8 6 4 2
[root@centos6mini app]# echo {99..1..2}
99 97 95 93 91 89 87 85 83 81 79 77 75 73 71 69 67 65 63 61 59 57 55 53 51 49 47 45 43 41 39 37 35 33 31 29 27 25 23 21 19 17 15 13 11 9 7 5 3 1

随机生成16位包含数字、大小写字母、符号的密码

cat /dev/urandom |tr -dc '0-9a-zA-Z!@_#?.,' |head -c 16

tr -d 和 tr -dc 的用法

[root@centos6mini app]# echo 12324345 |tr -d 2 #不要数字2
134345
[root@centos6mini app]# echo 12324345 |tr -dc 2 #支取数字2
22

for循环

        for 变量名 in 列表;do 
                循环体 
        done

执行机制：

依次将列表中的元素赋值给“变量名”; 每次赋值后即执 行一次循环体; 直到列表中的元素耗尽，循环结束

for循环的列表生成方式：

            (1) 直接给出列表

            (2) 整数列表：

                      (a) {start..end}

                    （b) $(seq [start [step]] end)

            (3) 返回列表的命令 $(COMMAND)

            (4) 使用glob，如：*.sh

            (5) 变量引用； $@, $*

批量创建user1至user10，要求设置随机16位密码，包含数字、大小写字母、符号。并要求用户使用密码首次登录后，强制设置新密码。

#!/bin/bash
> /root/user.log
for i in {1..10};do
#创建十个用户
        useradd user$i && echo user$i is created
#随机生成密码
        password=$(cat /dev/urandom |tr -dc '0-9a-zA-Z!@_#?.,' |head -c 16)
#将用户和密码导出
        echo user$i:$password >> /root/user.log
#设置密码
        echo $password |passwd --stdin user$i &> /dev/null
#强制下次登录修改密码
        passwd -e user$i &> /dev/null
done

使用♥，利用for，显示出一个等腰三角形。

方法一：

for ((i=1;i<10;i++))
do
        for ((j=1;j<=i;j++))
do
                echo -n "♥"
        done
        echo
done
for ((i=1;i<9;i++))
do
        for ((j=9;j>i;j--))
do
                echo -n "♥"
        done
        echo
done

♥
♥♥
♥♥♥
♥♥♥♥
♥♥♥♥♥
♥♥♥♥♥♥
♥♥♥♥♥♥♥
♥♥♥♥♥♥♥♥
♥♥♥♥♥♥♥♥♥
♥♥♥♥♥♥♥♥
♥♥♥♥♥♥♥
♥♥♥♥♥♥
♥♥♥♥♥
♥♥♥♥
♥♥♥
♥♥
♥

方法二：

#!/bin/bash2
read -p "请输入三角形的高度: " num
for i in  `seq $num`;do
        for x in `seq 1 $[$num-$i]`;do
                echo -e " \c"
        done
        for n in `seq 1 $[2*$i-1]`;do
                #yanse=`tr -dc '1-6' < /dev/urandom  | head -c 1`
                #echo -e "\e[3"$yanse"m♥\e[0m\c"
                echo -e "\e[34m♥\e[0m\c"
        done
        echo 
done
   ♥        
  ♥♥♥
 ♥♥♥♥♥
♥♥♥♥♥♥♥

方法三：

#!/bin/bash
for ((i = 1; i < 10; i++))
do
   for ((j = 10; j > i; j--))
   do  
      echo -n " ";
   done
   for ((m = 1; m <= i; m++))
   do  
       echo -n "$i "
   done
   echo ""
done
[root@centos7 ~]# ./sjx 
         1 
        2 2 
       3 3 3 
      4 4 4 4 
     5 5 5 5 5 
    6 6 6 6 6 6 
   7 7 7 7 7 7 7 
  8 8 8 8 8 8 8 8 
 9 9 9 9 9 9 9 9 9


方法四：

#!/bin/bash
#彩色闪烁山角形
read -p "请输入三角形边长： " w
for (( i=1;i<=$w;i++ )); do
        for(( j=$w;j>$i;j--  ));do
                echo -n " "
        done
        for (( m=1;m<=i;m++   ));do
                we=`cat /dev/urandom |tr -dc '1-6' |head -c 1 `
                echo -e  "\033[3"$we";5m♥\033[0m\c"   #红色加闪烁
                done
        echo

done

添加10个用户user1-user10，密码为8位随机字符、

#！/bin/bash
> /root/user.log
for i in {1..10};do    
    useradd user$i && echo user$i is created
    pass=$(cat /dev/urandom |tr -dc '0-9a-zA-Z!@_#?.,' |head -c 16)   #生成随机数
    echo user$i:---pass:$pass >> /root/user.log
    echo $pass |password --stdin user$i &> /dev/null
done

/etc/rc.d/rc3.d目录下分别有多个以K开头和以S开头的文件；分别读取每个文件，以K开头的输出为文件加stop，以S开头的输出为文件名加start，如K34filename stop  S66filename start

#!/bin/bash
for i in $(ls /etc/rc.d/rc3.d/);do   #查看文件内容确定循环次数
        if [[ $i =~ ^K.* ]];then
                echo "$i stop"
        elif [[ $i =~ ^S.* ]];then
                echo "$i start"
        fi
done
[root@centos6mini app]# ./linshi 
K05wdaemon stop
K10saslauthd stop
K15htcacheclean stop
K15httpd stop
K30spice-vdagentd stop
K50dnsmasq stop
K50kdump stop
K73winbind stop
K74ntpd stop
...省略...

编写脚本，提示输入正整数n的值，计算1+2+…+n的总和

#!/bin/bash
read -p "请输入一个正整数" s
w=0
if [[ "$s" =~ ^[0-9]+$ ]] ;then
    for i in  $(seq 1 $s) ;do
    w=$[$w+$i]                      
    
    done
    echo "整数1到$s的和为$w"
else echo "请输入正整数"
fi

计算100以内所有能被3整除的整数之和

方法一：

[root@centos6mini app]# echo {3..100..3} |tr " " "+"|bc    #进行步进，替换相加
1683

方法二：

#!/bin/bash
for i in {3..100..3};do    #步进，相加
 n=$[$n+$i]  &> /devnull
 done
echo $n

方法三：

#!/bin/bash
sum=0
for n in $(seq 1 100);do
        i=$[$n/3]    #进行相除
        y=$[3*$i]    #进行相乘 、运算成功则成立
        if [ $y -eq $n ];then
                sum=$[$n+$sum]
        fi
done  
        echo $sum

方法四：

sum=0
for i in {1..100};do
    if [ $[$i%3] -eq 0 ];then  #相除取余进行判定
    let sum+=$i   #进行加法运算
    fi  
done
echo $sum

打印九九乘法表

for (( i=1 ;i<=9;i++ ));do
        for ((n=1;n<=9;n++)) ;do
                w=0
                w=$[$n*$i]
        if [ $n -le $i   ];then
        echo -n  " $i*$n=$w "
        fi
        done
echo
done

在/testdir目录下创建10个html文件,文件名格式为数字N（从1到10）加随机8个字母，如：1AbCdeFgH.html

方法一：

#!/bin/bash
cd /testdir &> /dev/null
if [ ! $(echo $?) -eq 0 ] ;then   #判断文件是否存在
    mkdir /testdir &> /dev/null
fi

for i in $(seq 1 10 );do
    w=$(cat /dev/urandom |tr -dc '0-9a-zA-Z!@_#?.,' |head -c 8)
    touch $i$w.html
done

方法二：

if ! [ -d /testdir ];then   #判断文件是否存在
  mkdir /testdir &> /dev/null   #如果没有创建文件
fi
for i in {1..10};do  
  touch /testdir/$i`cat /dev/urandom |tr -dc [:alpha:] |head -c 8`.html    #创建文件
done

探测局域网内的主机

    172.18.250-254.X

    能ping通显示并保存至/root/ip.log

    要求并行探测提高效率。

   
[root@centos6mini zuoye]# cat 11.sh 
 #!/bin/bash
> /root/ip.log
for i in {250..255};do
    for n in {1..255};do
    {
    ping -c1 -w1 172.18."$i"."$n" &> /dev/null
    if [ $? -eq  0  ] ;then
    echo "ping 172.18."$i"."$n"  is up"  #>> /root/ip.log
    fi
    }&
    done
done

[root@centos6mini zuoye]# ./11.sh 
ping 172.18.250.14  is up
ping 172.18.250.26  is up
ping 172.18.250.71  is up
ping 172.18.250.81  is up
ping 172.18.250.112  is up
ping 172.18.250.154  is up
ping 172.18.250.164  is up
ping 172.18.250.166  is up
ping 172.18.250.183  is up
ping 172.18.250.195  is up
ping 172.18.250.212  is up
ping 172.18.250.216  is up
ping 172.18.250.224  is up
ping 172.18.250.249  is up
ping 172.18.250.250  is up
ping 172.18.251.18  is up

打印国际象棋棋盘


方法一：

[root@centos6mini zuoye]# cat qipan.sh 
#!/bin/bash
for n in {1..8};do
    for i in {1..8} ;do
        if [ $[$n%2]  -eq 0   ];then
            if [ $[$i%2]  -eq 0   ];then
                 echo -e "\033[41m  \033[0m\c"
            fi
            if [ $[$i%2] -ne 0   ] ;then
                  echo -e "\033[47m  \033[0m\c"
                
            fi
        else
             if [ $[$i%2]  -eq 0   ];then
                                  echo -e "\033[47m  \033[0m\c"
                        fi
                        if [ $[$i%2] -ne 0   ] ;then
                                 echo -e "\033[41m  \033[0m\c"
                        
                        fi

        fi
    done
    echo 
done

方法二：

#!/bin/bash
for xline in $(seq 1 8);do   #横向
  for yline in $(seq 1 8);do   #纵向
        if  [ $[$[$xline+$yline]%2] -eq 0 ];then   #判断；横向与纵向相加，最后相除是否等于0
          echo -e "\033[47m  \033[0m\c"
        else
          echo -e "\033[41m  \033[0m\c"
        fi
  done
  echo 
done

方法三：（放大版）

#!/bin/bash
for i in {1..8};do
        for x in {1..4};do  #控制单行大小。对已有输出进行放大
                for n in {1..8};do
                        a=`echo $[$[$i+$n]%2]`
                        if [ $a -eq 0 ];then
                                echo -e "\e[43m" "" "" "" "" "" "" "" "\e[0m\c"
                        else
                                echo -e "\e[42m" "" "" "" "" "" "" "" "\e[0m\c"
                        fi
                done
                echo
        done
done









while循环

            while CONDITION; do 
                    循环体
             done

CONDITION：循环控制条件；进入循环之前，先做一次判 断；每一次循环之后会再次做判断；条件为“true”，则执行 一次循环；直到条件测试状态为“false”终止循环

因此：CONDTION一般应该有循环控制变量；而此变量的值 会在循环体不断地被修正

    进入条件：CONDITION为true

    退出条件：CONDITION为false


“:” 和true的返回值都为真

[root@centos6mini zuoye]# true
[root@centos6mini zuoye]# echo $?
0
[root@centos6mini zuoye]# :
[root@centos6mini zuoye]# echo $?
0

判断/var/目录下所有文件的类型

[root@centos6mini app]# cat  linshi 
#!/bin/bash
dc=0
lc=0
cc=0
bc=0
oc=0
zc=0

ls -l /var |grep -v total >/tmp/var_ftype.txt
while read lines
do
   ftype=`echo $lines |awk '{print $1}' |cut -c 1`
   case $ftype in
        d) dname=`echo $lines |awk '{print $9}'`; echo "$dname is a Directory" ; let dc+=1;;
        l) lname=`echo $lines |awk '{print $9}'`; echo "$lname is a Links of Soft " ;let lc+=1 ;;
        c) cname=`echo $lines |awk '{print $9}'`; echo "$cname is a Character of file" ;let cc+=1;;
        b) bname=`echo $lines |awk '{print $9}'`; echo "$bname is a Block file" ; let bc+=1;;
        -) zname=`echo $lines |awk '{print $9}'`; echo "$zname is a common file" ; let zc+=1;;
        *) echo "Others files"; let oc+=1

   esac

done </tmp/var_ftype.txt
echo '-----------------------------' 
echo -e "var目录下普通文件数量: $zc\nvar目录下子目录数量：$dc\nvar目录下链接文件数量：$lc\nvar目录下字符类型文件数量: $cc\nvar
目录下块设备文件数量：$bc\n其他类型文件数量：$oc"
rm -f /tmp/var_ftype.txt


[root@centos6mini app]# ./linshi 
cache is a Directory
crash is a Directory
cvs is a Directory
db is a Directory
empty is a Directory
games is a Directory
gdm is a Directory
lib is a Directory
local is a Directory
lock is a Directory
log is a Directory
mail is a Links of Soft 
nis is a Directory
opt is a Directory
preserve is a Directory
run is a Directory
spool is a Directory
tmp is a Directory
www is a Directory
yp is a Directory
-----------------------------
var目录下普通文件数量: 0
var目录下子目录数量：19
var目录下链接文件数量：1
var目录下字符类型文件数量: 0
var
目录下块设备文件数量：0
其他类型文件数量：0

编写脚本，求100以内所有正奇数之和

方法一：

[root@centos6mini zuoye]# echo {1..100..2}
1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83 85 87 89 91 93 95 97 99
[root@centos6mini zuoye]# echo {1..100..2}|tr " " + |bc
2500

方法二：

[root@centos6mini 3.19]# ./1
2500
[root@centos6mini 3.19]# cat 1
#!/bin/bash
u=0 
for i in  {1..100..2}; do
    let u+=i
done
echo $u


方法三：

[root@centos6mini 3.19]# ./1
2500
[root@centos6mini 3.19]# cat 1 
#!/bin/bash
u=0 
i=1
while [ $i -le 100 ] ;do

    let u+=i
    let i+=2
done
echo $u

编写脚本，提示请输入网络地址，如192.168.0.0，判断输入的网段中主机在线状态，并统计在线和离线主机各多少

方式一：

#!/bin/bash
w=0
a=0
y=0
for (( d=0;d<256;d++ ));do
    for (( f=1;f<255;f++  ));do
        {
        ping -c1 -w1 172.18."$d"."$f" &> /dev/null
        a=`echo $?`

        if [ $a -eq 0 ] ; then 
            echo "172.18."$d"."$f"  up" >> /app/e.txt
            echo "172.18."$d"."$f"  up "    
        fi
        if [ $a -ne 0 ] ; then 
                        echo "172.18."$d"."$f"  down " >> /app/r.txt
            echo "172.18."$d"."$f"  down "                  
        fi
    }&
    done
done 
w=`cat /app/e.txt |wc -l`
echo "通的 :  $w"
y=`cat /app/r.txt |wc -l`
echo "不通的 :  $y"
rm -rf /app/e.txt
rm -rf /app/w.txt

方式二：

#!/bin/bash
i=1
q=1
w=0
a=0
y=0
while [ $i -lt  255  ];do
    while [ $q  -lt  255 ];do
        {
        ping -c1 -w1 172.18."$i"."$q" &> /dev/null
        a=`echo $?`
        if [ $a -eq 0 ] ; then 
            echo "172.18."$i"."$q"   up" >> /app/e.txt
            echo "172.18."$i"."$q"   ：up"
        fi
        if [ $a -ne 0 ] ; then 
                       echo "172.18."$i"."$q"  down "   >> /app/w.txt
                
               echo "172.18."$i"."$q"  down "

        fi
        }&
        let q=q+1

        
    done
    
    let   i=i+1
    q=1      ####将q的变量值从新赋值为1
done 
w=`cat /app/e.txt |wc -l`
echo "通的主机数为 :  $w"
y=`cat /app/w.txt |wc -l`
echo "不通的主机数为 :  $y"
rm -rf /app/w.txt /app/e.txt

图片.png

编写脚本，打印九九乘法表


[root@centos6mini 3.19]# cat 99 
#!/bin/bash
q=1
w=1
while [ $q -le 9 ];do
    while [ $w -le 9 ];do
        e=0
        let e=q*w   
        if [ $w -le $q ];then
        echo  -n "  $w*$q=$e  "
        fi

    let w+=1
    done
    let q+=1
    w=1
    echo
done
[root@centos6mini 3.19]# ./99
  1*1=1  
  1*2=2    2*2=4  
  1*3=3    2*3=6    3*3=9  
  1*4=4    2*4=8    3*4=12    4*4=16  
  1*5=5    2*5=10    3*5=15    4*5=20    5*5=25  
  1*6=6    2*6=12    3*6=18    4*6=24    5*6=30    6*6=36  
  1*7=7    2*7=14    3*7=21    4*7=28    5*7=35    6*7=42    7*7=49  
  1*8=8    2*8=16    3*8=24    4*8=32    5*8=40    6*8=48    7*8=56    8*8=64  
  1*9=9    2*9=18    3*9=27    4*9=36    5*9=45    6*9=54    7*9=63    8*9=72    9*9=81

4、编写脚本，利用变量RANDOM生成10个随机数字，输出这个10数字，并显示其中的最大值和最小值

[root@centos6mini 3.19]# ./4
25955
25748
16113
19729
8944
19049
16202
20067
30609
4309
最大值： 30609
最小值： 4309
[root@centos6mini 3.19]# cat 4 
#!/bin/bash
q=1
while [ $q -le 10 ] ;do
     echo $[RANDOM] &>> /app/o.txt
     #echo $[RAND0M] #每次随机都是新的值
    let q+=1    
done
cat /app/o.txt
w=`cat  /app/o.txt |sort -rn |tail -n1`
e=`cat /app/o.txt |sort -rn | head  -n 1`
echo "最大值： $e"
echo "最小值： $w"
rm -rf /app/o.txt


5、编写脚本，实现打印国际象棋棋盘[

[root@centos6mini 3.19]# cat 5,sh
#!/bin/bash
q=1
w=1
while [ $q -le 8 ]  ;do
    while [ $w -le 8 ] ;do
        if [ $[$[$q+$w]%2] -eq 0 ] ;then   ##判断句中的计算需要$[]括起来：
            echo -e "\033[47m  \033[0m\c"
        else
            echo -e "\033[41m  \033[0m\c"
        fi
    
    let w+=1
    done
    let q+=1
    w=1
    echo
done

后续六个字符串：efbaf275cd、4be9c40b8b、44b2395c46、f8c8873ce0、b902c16c8b、ad865d2f63是通过对随机数变量RANDOM随机执行命令：

   echo $RANDOM|md5sum|cut –c1-10

   后的结果，请破解这些字符串对应的RANDOM值


方法一:

#!/bin/bash
>6
while true ;do
        while true ;do
                w=`echo $RANDOM `  #定义变量--随机数随时在变化,给他赋值一个变量,后边取值就不在变化了
                q=`echo $w|md5sum|cut -c1-10`
                if [ $q == efbaf275cd  ] ;then
                        echo "efbaf275cd=$w" #>>6
                elif [ $q == 4be9c40b8b  ] ;then
                        echo "4be9c40b8b=$w" #>>6
                elif [ $q  == 44b2395c46  ] ;then
                        echo "44b2395c46=$w" #>>6
                elif [ $q == f8c8873ce0  ] ;then
                        echo "f8c8873ce0=$w" #>>6
                elif [ $q == b902c16c8b  ] ;then
                         echo "b902c16c8b=$w" #>>6
                elif [ $q == ad865d2f63 ] ;then
                         echo "ad865d2f63=$w" #>>6
                fi

        done
done
[root@centos6mini ~]# cat 6 |sort|uniq
44b2395c46=9000
4be9c40b8b=12000
ad865d2f63=1000
b902c16c8b=3000
efbaf275cd=15000
f8c8873ce0=6000


方法二:

#!/bin/bash
sum=0
for i in {1..32767};do
        num=`echo $i |md5sum | cut -c1-10`
        case $num in
                efbaf275cd|4be9c40b8b|44b2395c46|f8c8873ce0|b902c16c8b|ad865d2f63)
                        echo $i
                        let sum++
                ;;
        esac
        if [ $sum -lt 6 ];then
                continue
        else
                break
        fi
done

$#和$*差别

[root@centos6mini 3.19]# ./linshi  1 2 2 3 4
1 2 2 3 4
2 2 3 4
2 3 4
3 4
4
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
while [ $# -gt 0 ];do    
    echo $*
    shift
done

[root@centos6mini 3.19]# ./linshi  1 2 2 3 4
5
4
3
2
1
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
while [ $# -gt 0 ];do    
    echo $#
    shift
done


使用一条命令，依次创建指定的用户。如执行createuser.sh tom bob alice harry

方法1：

[root@centos6mini 3.19]# ./linshi createuser.sh tom bob alice harry 
createuser.sh 用户创建成功
tom 用户创建成功
bob 用户创建成功
alice 用户创建成功
harry 用户创建成功
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
#!/bin/bash
while [ $# -gt 0 ]
do 
        

        id $1 &>/dev/null
        if [ $? -eq 0 ];then
                echo $1 is already exsit.
                shift
                continue
        fi
        useradd $1
        echo "$1 用户创建成功"
        shift

done

删除用户
[root@centos6mini 3.19]# ./linshi createuser.sh tom bob alice harry 
createuser.sh 用户删除成功
tom 用户删除成功
bob 用户删除成功
alice 用户删除成功
harry 用户删除成功
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
while [ $# -gt 0 ]；do 
           userdel -r  $1
           echo "$1 用户删除成功"
           shift
done

方法2：

#!/bin/bash
while [ $# -gt 0 ];do
        id $1 &> /dev/null && { echo $1 is alread exist && shift && continue; }
        useradd $1 && echo  $1 is created
        shift
done


每隔3秒钟到系统上获取已经登录的用户的信息；如果发现用户hacker登录，则将登录时间和主机记录于日志/var/log/login.log中,并退出脚本

#!/bin/bash
while true;do
if $(ps -au |grep "^hacker.*" &> /dev/null);then   #监测前台终端上有没有用户登陆信息
        echo $(ps -au |grep "^hacker.*" |tr -s " " |cut -d" " -f1,7,9) >> /var/log/login.log
            #将用户登陆信息保存到日志文件中/var/log/login.log
        break   #推出监测
else
        sleep 3s   #三秒已监测，防止程序太多占用cpu
fi
done

随机生成10以内的数字，实现猜字游戏，提示比较大或小，相等则退出

[root@centos6mini 3.19]# ./linshi 
请输入数值 ：  1
错了 ，小了
请输入数值 ：  9
错误，大了
请输入数值 ：  5
猜对了
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
qe=$( echo $[$RANDOM%10] )  
while true ;do
read -p "请输入数值 ：  " qw
        if  [ $qw -gt $qe   ] ;then
                echo "错误，大了"

        elif [ $qw -lt $qe   ] ;then
                echo "错了 ，小了"
        elif [ $qe -eq $qw  ];then
                echo "猜对了"
                break
        fi

done

用文件名做为参数，统计所有参数文件的总行数

[root@centos6mini 3.19]# ./linshi /etc/passwd /etc/sysconfig/network-scripts/ifcfg-eth1 /etc/passwd
89
[root@centos6mini 3.19]# cat linshi 
#!/bin/bash
sumhang=0
while [ $# -gt 0  ];do
        hang=$( cat $1 | wc -l  )
        let sumhang+=hang
        shift
done
echo $sumhang

4、用二个以上的数字为参数，显示其中的最大值和最小值

方法一：

#!/bin/bash
min=$1  #最小值等于第一个数值
max=$1  #最大数等于第一个数值

while [ $# -gt 0 ];do    #进行数值数量进行判断，做循环
        value=$1     #定义变量
        if [ $value  -gt $max ];then   #当第二个数大于第一个数时
                max=$value  #最大值等于后一个数值，对max从新赋与新的值
        elif [ $value -lt $min ];then    #当第二个数大于第一个数时
                min=$value   #最小值等于后一个数值 对min从新赋与新的值
        fi
        shift #不管前面判断是否成立，都进行数列左移，
done
echo "min $min"
echo "max $max"

方法二：

#!/bin/bash
if [ $# -lt 2 ];then  #对输入数字数量进行检测
        echo "type more than two numbers"
        exit 1
fi

small=$(echo $* |xargs -n1 |sort -n |head -n 1)   #进行数值排序
big=$(echo $* |xargs -n1 |sort -n |tail -n 1)
echo "Maximum number is $big"
echo "Minimum number is $small"

[root@localhost ~]# echo 1 -3 -99 46 7  32 43 2133 312 |xargs -n1  #以一数列进行显示
1
-3
-99
46
7
32
43
2133
312

read 示例：

[root@centos6mini 3.19]# while read -p "type your name: " name ;do  echo your is $n$name; done
type your name: zhangsan
your is zhangsan
type your name: lisi
your is lisi
type your name: wangwu
your is wangwu
type your name: ^C

[root@centos6mini 3.19]# read bing < test。txt
[root@centos6mini 3.19]# echo $bing   
hello

^C
[root@centos6mini 3.19]# while read name ; do echo $name ;done  # 没有指定输入
123     #输入
123     #输出
qwe       #输入
qwe     #输出
asd     #输入
asd     #输出
zxc     #输入
zxc     #输出
^C^[[A^C
[root@centos6mini 3.19]# while read name ; do echo $name ;done <6   #name为变量，输入来自文件文件内容读取完了，循环停止
hello
qweqew
12341234
asdas
ads
sda
sad
asd
as
asd
as

read 示例：

显示UID小于1000的为sys user，大于等于1000的为comm user。

[root@centos6mini 3.19]# cat linshi       
#!/bin/bash
while read usline ;do  #通过read ，定义变量值usline
        usuid=$(  echo $usline |cut -d: -f3 ) ，#引用变量usline ，并定义变量usuid
        usname=$( echo $usline |cut -d: -f1 )  #引用变量usline ，并定义变量usname
        #if [ $usuid -lt 1000 ];then   #进行判断
        if (( $usuid < 1000 )) ;then   #进行判断（两种方式均可以）
                echo "$usname is a sys user"
        else 
                echo "$usname is a comm user"
        fi

done < /etc/passwd  #每次循环引用文件内容一行，进行操作，引用完了，循环停止。
[root@centos6mini 3.19]# ./linshi   
root is a sys user
bin is a sys user
daemon is a sys user
adm is a sys user
lp is a sys user
sync is a sys user
shutdown is a sys user
halt is a sys user
mail is a sys user
uucp is a sys user
operator is a sys user
games is a sys user
gopher is a sys user
ftp is a sys user
nobody is a sys user
vcsa is a sys user
saslauth is a sys user

找出分区利用率大于10%的分区，并发出警告/dev/sdaX will be full: 15%要求使用while read来实现


答案1：

#!/bin/bash
df |grep /dev/sd > /app/fenqu
while read line;do
        used=$(echo $line |tr -s " " % |cut -d% -f5)
        name=$(echo $line |cut -d" " -f1)
        if (( $used > 10 ));then
                echo "$name will be full:$used%"
        fi
done < /app/fenqu


[root@centos6mini 3.19]# df |grep /dev/sd >/app/zuoye/3.19/6
[root@centos6mini 3.19]# cat /app/zuoye/3.19/6
/dev/sda5      28564480 1872060  25234756  7% /
/dev/sda2      20511356  70276  19392504  1% /app
/dev/sda1        194241  31785    152216  18% /boot
[root@centos6mini 3.19]# while read line ;do
> used=$(echo $line |tr -s " " % |cut -d% -f5)
>  name=$(echo $line |cut -d" " -f1)
> if (( $used > 10 ));then
>  echo "$name will be full:$used%"
> fi
> done </app/zuoye/3.19/6
/dev/sda1 will be full:18%

答案2：

#!/bin/bash
> df_h
df -h | grep ^/dev/[sh]d* >> df_h
while read disk;do
    a=`echo $disk |grep -o "\<[0-9]\{0,3\}%" | cut -d% -f1`
    b=`echo $disk |grep -o "^[^[:space:]]\+\>"`
    if [ $a -gt 10 ];then
        echo "$b will be full: $a%"
    fi  
done < df_h

答案3：sed实现  

#!/bin/bash
df |grep /dev/sd |while read disk;do
        diskused=$(echo $disk |sed -r 's/.* ([0-9]+)%.*/\1/')
        diskname=$(echo $disk |sed -r 's@(/dev/sd[[:lower:]][[:digit:]]).*@\1@')
        if (( $diskused > 10 ));then
                echo "$diskname will be full:$diskused%"
        fi
done


until循环

            until CONDITION; do 
                        循环体 
            done

    
    进入条件： CONDITION 为false

    退出条件： CONDITION 为true


循环控制语句continue
用于循环体中

continue [N]：提前结束第N层的本轮循环，而直接进入下一 轮判断；最内层为第1层

while CONDTIITON1; do 
      CMD1
       ... 
       if CONDITION2; then 
        continue 
         fi 
       CMDn

循环控制语句break

用于循环体中

break [N]：提前结束第N层循环，最内层为第1层

while CONDTIITON1; do 
    CMD1 
    ... 
    if CONDITION2; then 
            break 
    fi 
     CMDn
     ... 
done

循环控制shift命令
shift [n]

用于将参量列表 list 左移指定次数，缺省为左移一次。

参量列表 list 一旦被移动，最左端的那个参数就从列表中删 除。while 循环遍历位置参量列表时，常用到 shift

./doit.sh a b c d e f g h

./shfit.sh a b c d e f g h

特殊用法

1、while循环的特殊用法（遍历文件的每一行）：

while read line; do 
        循环体
done < /PATH/FROM/SOMEFILE

依次读取/PATH/FROM/SOMEFILE文件中的每一行，且将 行赋值给变量line

2、双小括号方法，即((…))格式，也可以用于算术运算

双小括号方法也可以使bash Shell实现C语言风格的变量操作

        I=10

        ((I++))

for循环的特殊格式： for ((控制变量初始化;条件判断表达式;控制变量的修正表达 式)) 
do 
        循环体
done

控制变量初始化：仅在运行到循环代码段时执行一次

控制变量的修正表达式：每轮循环结束会先进行控制变量修 正运算，而后再做条件判断


select循环与菜单

select variable in list
    do 
        循环体命令 
    done

select 循环主要用于创建菜单，按数字顺序排列的 菜单项将显示在标准错误上，并显示 PS3 提示符， 等待用户输入

用户输入菜单列表中的某个数字，执行相应的命令

用户输入被保存在内置变量 REPLY 中


select与case

select 是个无限循环，因此要记住用 break 命令退 出循环，或用 exit 命令终止脚本。也可以按 ctrl+c 退出循环

select 经常和 case 联合使用

与 for 循环类似，可以省略 in list，此时使用位置 参量


信号捕捉trap

trap '触发指令' 信号

            自定义进程收到系统发出的指定信号后，将执行触发指令 ，而不会执行原操作

trap '' 信号

            忽略信号的操作

trap '-' 信号

            恢复原信号的操作

trap -p

            列出自定义信号操作


文件测试

    -z string 测试指定字符是否为空，空着真，非空为假
    -n string 测试指定字符串是否为不空，空为假 非空为真    -e FILE 测试文件是否存在    -f file 测试文件是否为普通文件    -d file 测试指定路径是否为目录
    -r file 测试文件对当前用户是否可读
    -w file 测试文件对当前用户是否可写
    -x file 测试文件对当前用户是都可执行
    -z  是否为空  为空则为真    -a  是否不空
    -u  file ：是否存在且拥有suid权限 
    -g  file ：是否存在且拥有sgid权限 
    -k  file ：是否存在且拥有sticky权限

[root@centos6mini 3.19]# [ -n ""  ]&& echo true   #空为假
[root@centos6mini 3.19]# [ -n "1"  ]&& echo true   #非空为真
true
[root@centos6mini 3.19]# [ -n "  "  ]&& echo true   #非空为真
true
[root@centos6mini 3.19]# [ -n   ]&& echo true    #非空为真
true
[root@centos6mini 3.19]# [ -z   ]&& echo true   #空为真
true
[root@centos6mini 3.19]# [ -z "" ]&&echo true  #空为真
true
[root@centos6mini 3.19]# [ -z "1" ] && echo true      "#非空为假
[root@centos6mini 3.19]# [ -z "  " ] && echo true      #非空为假

扫描/etc/passwd文件每一行，如发现GECOS字段为空，则填充用户名和单位电话为62985600，并提示该用户的GECOS信息修改成功。 

#!/bin/bash
cat /etc/passwd |while read userline;do  #用管道实现给循环while赋值
        if [ -n "$(echo $userline |cut -d: -f5)" ];then    #-n "1" 非空为真
                continue     #为真时啥都不做
        else
                username=$(echo $userline|cut -d: -f1)
                usermod -c $username-62985600 $username
                echo $username\'s gecos already changed!
        fi
done

特殊用法

双小括号方法，即((…))格式，也可以用于算术运算 

双小括号方法也可以使bash Shell实现C语言风格的变量操作 

I=10 

((I++)) 

for循环的特殊格式： 

for ((控制变量初始化;条件判断表达式;控制变量的修正表达 式)) 

    do 

        循环体

    done

 控制变量初始化：仅在运行到循环代码段时执行一次 

控制变量的修正表达式：每轮循环结束会先进行控制变量修 正运算，而后再做条件判断

16077c1b-7b7a-489a-abc8-1ef4989b0797.jpg



练习：计算从1加到100的和。

#!/bin/bash
sum=0
for ((i=1;i<=100;i++));do
        let sum+=i
done
echo sum=$sum
unset sum i
  
sum=0
i=1
while [ $i -le 100 ];do
        let sum+=i
        let i++
done
echo sum=$sum

select循环与菜单

select variable in list 

    do 

            循环体命令 

    done 

select 循环主要用于创建菜单，按数字顺序排列的 菜单项将显示在标准错误上，并显示 PS3 提示符， 等待用户输入

 

 PS3="Please choose your menu: "

用户输入菜单列表中的某个数字，执行相应的命令 

用户输入被保存在内置变量 REPLY 中

[root@centos6mini 3.19]# ./linshi     
1) huangmenji
2) huimian
3) hulatang
4) roujiamo
Please choose your menu: 1
The price is $15
Please choose your menu: 2
The price is $10
Please choose your menu: 3
The price is $8
Please choose your menu: 4
The price is $6
Please choose your menu: 5
get out

[root@centos6mini 3.19]# cat ./linshi   
#!/bin/bash

select menu in huangmenji huimian hulatang roujiamo;do 
        case $REPLY in
                1) echo "The price is \$15";;
                2) echo "The price is \$10";;
                3) echo "The price is \$8";;
                4) echo "The price is \$6";;
                *) echo "get out";break;;
        esac
done

信号捕捉trap 

trap '触发指令' 信号

        自定义进程收到系统发出的指定信号后，将执行触发指令 ，而不会执行原操作 

trap '' 信号 忽略信号的操作 

rap '-' 信号 恢复原信号的操作 

trap -p 列出自定义信号操作

trap 所有可选项

[root@centos6mini 3.19]# trap -l 
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX

#!/bin/bash 
trap 'echo “signal:SIGINT"'  int     # int 相当与Ctrl+c
trap -p 
for((i=0;i<=10;i++)) 
do 
sleep 1
echo $i 
done
trap ''  int #trap '' 信号 忽略信号的操作 
trap -p 
for((i=11;i<=20;i++)
do 
sleep 1
echo $i 
done 
trap '-'  int   #rap '-' 信号 恢复原信号的操作 
trap -p 
for((i=21;i<=30;i++)
do 
sleep 1 
echo $i
done





忽略kill -15 ,操作可以成功

ef1b777a-c538-4e83-b89a-26de8eb6ebe7.jpg


忽略kill -9操作 ,不成功,无法忽略kill -9


85693952-6647-4f49-8659-47a8baaa03c1.jpg
trap -l，把所有信号打印出来



查看kill -9 和kill -15 对应的信号选项 

afc41590-b38e-4936-bc13-7160ac361cfa.png

select与case 

select 是个无限循环，因此要记住用 break 命令退 出循环，或用 exit 命令终止脚本。也可以按 ctrl+c 退出循环

select 经常和 case 联合使用 

与 for 循环类似，可以省略 in list，此时使用位置 

```
