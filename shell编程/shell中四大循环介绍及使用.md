[shell中四大循环介绍及使用](https://blog.51cto.com/longlei/2347421)



# 1、for循环结构语法及实例
## 1.1、for循环结构语法1

for 变量名 in 变量取值列表
do
    指令……….
done

提示：此结构中“in 变量取值列表”可省略，省略时相当于in “$@”，使用for i就相当于使用for i in “$@”

## 1.2、for循环结构语法2

for ((exp1;exp2;exp3)); do
        指令…………
   done

![for循环结构语法2 流程图](https://s1.51cto.com/images/20190128/1548686725355810.png?x-oss-process=image/watermark,size_16,text_QDUxQ1RP5Y2a5a6i,color_FFFFFF,t_100,g_se,x_10,y_10,shadow_90,type_ZmFuZ3poZW5naGVpdGk=)



exp1只执行一次，相当于在for里嵌了while

## 1.3、for循环结构基础实例
### 例1：for循环直接输出元素5到1的方法

#!/bin/bash

for num in 5 4 3 2 1

  do

   echo $num

 done
 
### 例2：for循环使用大括号的方法输出元素5到1

#!/bin/bash

for num in {5..1}

  do

   echo $num

 done

 
### 例3：for循环使用seq方法实现输出元素5到1

#!/bin/bash

for num in `seq -s " " 5 -1 1` 

#这里-s指定分隔符为空格，5为第一个输出字符，-1为步长，1为最后一个字符

  do

   echo $num

 done

 
### 例4：使用for循环进行文件批量改名，把jpg改成gif

[root@localhost test]# ls

1.jpg  2.jpg  3.jpg  4.jpg  5.jpg

[root@localhost test]# for a in `ls /root/test/`;do mv $a `echo $a|cut -d . -f1`.gif; done

[root@localhost test]# ls

1.gif  2.gif  3.gif  4.gif  5.gif

 
### 例5：for循环在/abc目录下创建文件abc-1至abc-10

#!/bin/bash

mkdir /abc && cd /abc

for a in {1..10}

   do

  touch abc-$a

done

 
### 例6：for循环批量创建10个普通用户abc-01至abc-10，密码设置为aaa-01至aaa-10

#!/bin/bash

for num in `seq -w 10`   #说明：-w以0补充列宽

  do

   useradd abc-$num

   echo "aaa-$num"|passwd --stdin "abc-$num"

 done

 
### 例7：for循环批量创建用户密码为8位随机字符串

#先实现8位随机数的取值

[root@localhost ~]# echo $(date +%N)   #%N微秒，每次数字很难相同

099765771

[root@localhost ~]# echo $RANDOM   #随机函数，每次值都不同

11755

[root@localhost ~]# echo $(date +%N)$RANDOM   #两个组合生成更加不同的随机数

73312156513717

[root@localhost ~]# echo $(date +%N)$RANDOM|md5sum|cut -c 1-8  

#把随机数再使用md5加密，然后取8位即可

e65d36e5

 

#脚本创建用户随机密码实现：

#!/bin/bash

for num in `seq -w 10`

  do

#注意：这里一定要定义密码的变量，不然后面echo输出的密码就不正确了。

   password=$(echo $(date +%N)$RANDOM|md5sum|cut -c 1-8)

   useradd abc-$num

   echo "aaa-$num"|passwd --stdin "abc-$num"

   echo -e "用户名：abc-$num 密码：$password" >>/root/user.txt

 done

 

一句话实现方式：

[root@localhost ~]# for num in `seq -w 10`;do  password=$(echo $(date +%N)$RANDOM|md5sum|cut –c 1-8);echo -e "用户名：abc-$num 密码：$password";done

用户名：abc-01 密码：66e7c7ab

用户名：abc-02 密码：34dd9e01

用户名：abc-03 密码：9accf4e5

用户名：abc-04 密码：919cad0a

用户名：abc-05 密码：b2c259c0

用户名：abc-06 密码：c59e255f

用户名：abc-07 密码：bd8bd4f7

用户名：abc-08 密码：62b9633d

用户名：abc-09 密码：cac00924

用户名：abc-10 密码：839317aa

 
例8：求出（1+2+3...+n）的总和

#!/bin/bash

sum=0

read -p "请输入一个需要从1加到多少的整数：" num

if [[ $num =~ [^0-9] ]];then

   echo "输入有误，请输入大于0的整数！！！"

elif [[ $num -eq 0 ]];then

   echo "输入有误，请输入大于0的整数！！！"

else

   for i in $(seq 1 $num);do

      sum=$[$sum+$i]

   done

   echo $sum

fi

分析：sum初始值为0，请输入一个数，先判断输入的是否含有除数字以外的字符，有就报错；没有判断是否为0，不为0进入for循环，i的范围为1~输入的数，每次的循环为sum=sum+i，循环结束，最后输出sum的值。


