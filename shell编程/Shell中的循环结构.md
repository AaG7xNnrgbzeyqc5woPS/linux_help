[Shell中的循环结构](https://blog.csdn.net/weixin_42537435/article/details/92628218)

```
步进循环语句for

for循环是最简单，也是最常用的循环语句。for循环通常用于遍历整个对象或者数字列表。按照循环条件的不同，for循环语句可以分为带列表的for循环、不带列表的for循环以及类C风格的for循环。
带列表的for循环语句

带列表的for循环通常用于将一组语句执行已知的次数，其基本语法如下：

for variable in {list}
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

在上面的语法中，variable称为循环变量，list是一个列表，可以是一系列的数字或者字符串，元素之间使用空格隔开。do和done之间的所有的语句称为循环体，即循环结构中重复执行的语句。for循环体的执行次数与list中元素的个数有关。在带列表的for语句的执行时，Shell会将in关键字后面的list列表的第1个元素的值赋给变量variable，然后执行循环体；当循环体中的语句执行完毕之后，Shell会将列表中的第2元素的值赋给变量variable，然后再次执行循环体。当list列表中的所有的元素都被访问后，for循环结构终止，程序将继续执行done语句后面的其他的语句。

【例1】演示将数字列表作为循环条件列表的for语句的使用方法

#! /bin/bash

#for循环开始
for var in 1 2 3 4 5 6 7 8
do
   #依次输出列表中的数字
   echo "the number is $var"
done

    1
    2
    3
    4
    5
    6
    7
    8

运行以上程序：

[root@localhost ~]# ./test.sh
the number is 1
the number is 2
the number is 3
the number is 4
the number is 5
the number is 6
the number is 7
the number is 8

    1
    2
    3
    4
    5
    6
    7
    8
    9

【例2】本例将【例1】进行改造，使用了简单的书写方法

#! /bin/bash

#使用省略的写法表示某个范围
for var in {1..8}
do
   echo "the number is $var"
done

    1
    2
    3
    4
    5
    6
    7

运行以上程序

[root@localhost ~]# ./test.sh
the number is 1
the number is 2
the number is 3
the number is 4
the number is 5
the number is 6
the number is 7
the number is 8

    1
    2
    3
    4
    5
    6
    7
    8
    9

Shell允许用户指定for语句的步长。当用户需要另外指定步长时，其基本语法如下：

for varibale in {start..end..step}
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

【例3】演示通过for循环，并配合步长来计算100以内奇数的和

#! /bin/bash
#定义变量，并赋初值为0
sum=0;
#for循环开始，设置起始数值为1，结束数值为100，步长为2
for i in {1..100..2}
do
   #将数累加
   let "sum+=i"
done
echo "the sum is $sum"

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

运行以上程序

[root@localhost ~]# ./test.sh
the sum is 2500

    1
    2

【例4】本例将1周中7天的名字作为列表条件，依次输出每天的名称

#! /bin/bash
#for循环开始
for day in {Mon Tue Wed Thu Fri Sat Sun}
do
   #输出循环变量的值
   echo "$day"
done

    1
    2
    3
    4
    5
    6
    7

运行以上程序：

[root@localhost ~]# ./test.sh
{Mon
Tue
Wed
Thu
Fri
Sat
Sun}

    1
    2
    3
    4
    5
    6
    7
    8

【例5】通过ls命令的输出结果作为for循环的执行条件

#! /bin/bash

#使用ls命令的执行结果作为列表
for file in $(ls)
do
   #输出每个文件名
   echo "$file"
done

    1
    2
    3
    4
    5
    6
    7
    8

运行以上程序

[root@localhost ~]# ./test.sh
aaa
anaconda-ks.cfg
Desktop
Documents
Downloads
initial-setup-ks.cfg
Music
Pictures
Public
Templates
test.sh
Videos

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

【例6】使用通配符“*”作为条件列表

#! /bin/bash
#使用通配符作为列表条件
for file in *
do
   echo "$file"
done

    1
    2
    3
    4
    5
    6

运行以上程序

[root@localhost ~]# ./test.sh
aaa
anaconda-ks.cfg
Desktop
Documents
Downloads
initial-setup-ks.cfg
Music
Pictures
Public
Templates
test.sh
Videos

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

【例7】说明如何使用for循环逐个处理脚本的参数值

#! /bin/bash
#输出所有的参数
echo "$*"
#将参数列表作为条件
for arg in $*
do
   #依次输出各个参数值
   echo "${arg}"
done

    1
    2
    3
    4
    5
    6
    7
    8
    9

运行以上程序

[root@localhost ~]# ./test.sh a b c d de f
a b c d de f
a
b
c
d
de
f

    1
    2
    3
    4
    5
    6
    7
    8

不带列表的for循环语句

在某些特殊情况下，for循环的条件列表可以完全省略，称为不带列表的for循环语句。如果没有为for循环提供条件列表，Shell将从命令行获取条件列表。不带列表的for循环语句的一般语法如下：

for variable
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

由于系统变量$@同样可以获取所有的参数，所以以上的语法等价于以下语法：

for variable in $@
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

也同样等价于以下语法：

for variable in $*
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

【例8】演示不带列表的for循环语句的使用方法

#! /bin/bash
#不带条件列表
for arg
do
   #输出每个参数
   echo "$arg"
done

    1
    2
    3
    4
    5
    6
    7

运行以上程序

[root@localhost ~]# ./test.sh a b c d de f 
a
b
c
d
de
f

    1
    2
    3
    4
    5
    6
    7

类C风格的for循环语句

类C风格的for循环语句的基本语法如下：

for ((expression1;expression2;expression3))
do
   statement1;
   statement2;
   ...
done

    1
    2
    3
    4
    5
    6

在上面的语法中，for循环语句的执行条件被2个圆括号包括起来。执行条件分为3个部分，由2个分号隔开，第1部分expression1通常时条件变量初始化的语句；第2部分expression2是决定是否执行for循环的条件。当expression2的值为0时，执行整个循环体；当expression2的值为非0时，退出for循环体。第3部分，即表达式expression3通常用来改变条件变量的值，例如递增或者递减等。
【例9】演示类C风格的for循环语句的使用方法

#! /bin/bash
#for循环开始
for (( i=1;i<5;i++))
do
   #输出循环变量i的值
   echo "$i"
done

    1
    2
    3
    4
    5
    6
    7

运行以上程序

[root@localhost ~]# ./test.sh
1
2
3
4

    1
    2
    3
    4
    5

使用for循环语句处理数组

使用for循环遍历数组非常方便。针对数组，Shell专门提供了一种特殊语法的for循环语句，其基本语法如下：

for variable in ${array[*]}
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

其中，变量variable是循环变量，in关键字后面的部分表示要遍历的数组，其中array表示数组的名称。在遍历数组的过程中，for循环语句会将每个数组元素的值赋给循环变量variable。因此，用户可以在循环体中对每个数组元素进行相应的操作。
【例10】演示通过for循环来遍历数组

#! /bin/bash
#定义数组
array=(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
#通过for循环遍历数组元素
for day in ${array[*]}
do
   #输出每个数组元素的值
   echo $day
done

    1
    2
    3
    4
    5
    6
    7
    8
    9

运行以上程序

[root@localhost ~]# ./test.sh
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
Sunday

    1
    2
    3
    4
    5
    6
    7
    8

until循环语句

until循环语句同样也存在于多种程序设计语言中。顾名思义，until语句的作用时将循环体重复执行，直到某个条件成立为止。恰当地使用until语句，可以收到事半功倍地效果。
until语句的基本语法

until循环语句的功能是不断地重复执行循环体中的语句，直至某个条件成立。until语句的基本语法如下：

until expression
do
   statement1
   statement2
   ...
done

    1
    2
    3
    4
    5
    6

在上面的语法中，expression是一个条件表达式。当该表达式的值不为0时，将执行do和done之间的语句；当expression的值为0时，将退出until循环结构，继续执行done语句后面的其它的语句。
【例11】演示until语句的使用方法

#! /bin/bash
#定义循环变量i
i=1
#当i的值小于9时执行循环
until [[ "$i" -gt 9 ]]
do
   #计算i的平方
   let "square=i*i"
   #输出i的平方
   echo "$i*$i=$square"
   #循环变量加1
   let "i=i+1"
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1
2*2=4
3*3=9
4*4=16
5*5=25
6*6=36
7*7=49
8*8=64
9*9=81

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

利用until语句批量增加用户

until ：这个结构在循环的顶部判断条件,并且如果条件一直为 false 那就一直循环下去.(与 while 相反)。注意: until 循环的判断在循环的顶部,这与某些编程语言是不同的. 与 for 循环一样,如果想把 do 和条件放在一行里,就使用";
【例】演示基础的until语句

[root@foundation0 ~]# cat test.sh 
#!/bin/bash 
END_CONDITION=end 
until [ "$var1" = "$END_CONDITION" ] 
# 在循环的顶部判断条件. 
do 
echo "Input variable #1 " 
 echo "($END_CONDITION to exit)" 
 read var1 
 echo "variable #1 = $var1" 
 echo 
 done 
 exit 0 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

运行以上程序

[root@localhost ~]# ./test.sh
./test.sh: line 3: [: missing `]'
Input variable #1
(end to exit)
8
variable #1 = 8

    1
    2
    3
    4
    5
    6

【例12】演示如何通过循环语句来批量地增加用户，并设置用户的初始密码

#! /bin/bash
#定义变量i
i=1
#一直循环到变量i的值为21
until [ "$i" -eq 21 ]
do
   #执行useradd命令添加用户
   useradd user$i
   #修改用户密码
   echo "password" | passwd --stdin user$i > /dev/null
   #循环变量自增
   let "i++"
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

运行以上程序

[root@localhost ~]# ./test.sh
[root@localhost ~]# more /etc/passwd
........
user1:x:1001:1001::/home/user1:/bin/bash
user2:x:1002:1002::/home/user2:/bin/bash
user3:x:1003:1003::/home/user3:/bin/bash
......
user12:x:1012:1012::/home/user12:/bin/bash
user13:x:1013:1013::/home/user13:/bin/bash
user14:x:1014:1014::/home/user14:/bin/bash
.......
user20:x:1020:1020::/home/user20:/bin/bash

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12

【例13】介绍如何通过循环删除系统用户

#! /bin/bash
i=1
until [ "$i" -eq 21 ]
do
   #依次删除用户
   userdel -r user$i
   let "i++"
done

    1
    2
    3
    4
    5
    6
    7
    8

运行以上程序

【例12】中创建的用户被删除

    1

while循环语句

while循环是另外一种常见的循环结构。使用while循环结构，可以使得用户重复执行一系列的操作，直到某个条件的发生。这听起来好像跟until循环非常相似，但是与until语句相比，while语句有着较大的区别。
while语句的基本语法

while循环语句的基本语法如下：

while expression
do
	statement1
	statement2
	...
done

    1
    2
    3
    4
    5
    6

在上面的语法中，expression表示while循环体执行时需要满足的条件。虽然可以使用任意合法的Shell命令，但是，通常情况下，expression代表一个测试表达式。与其他的循环结构一样，do和done这2个关键字之间的语句构成了循环体。
通过计数器控制while循环结构

所谓计数器，实际上就是指一个循环变量，当该变量的值在某个范围内时，执行循环体；当超过该范围时，终止循环。
【例14】使用while循环来输出1~9的平方

#! /bin/bash
#定义循环变量
i=1
#while循环开始
while [[ "$i" -lt 10 ]]
do
   #计算平方
   let "square=i*i"
   #输出平方
   echo "$i*$i=$square"
   #循环 变量自增
   let "i=i+1"
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1
2*2=4
3*3=9
4*4=16
5*5=25
6*6=36
7*7=49
8*8=64
9*9=81

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

【例15】使用while循环来输出变量值

#!/bin/bash 
echo 
#等价于: 
while [ "$var1" != "end" ] # while test "$var1" != "end" 
do 
echo "Input variable #1 (end to exit) " 
read var1 # 为什么不使用'read $var1'? 
echo "variable #1 = $var1" # 因为包含"#"字符,所以需要"" 
# 如果输入为'end',那么就在这里 echo. 
# 不在这里判断结束,在循环顶判断. 
echo 
done  
exit 0 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13

[root@localhost ~]# ./test.sh

Input variable #1 (end to exit) 
test
variable #1 = test

Input variable #1 (end to exit) 
test2
variable #1 = test2

Input variable #1 (end to exit) 
test3
variable #1 = test3

Input variable #1 (end to exit) 
end
variable #1 = end

[root@localhost ~]# 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20

通过计数器控制while循环结构

一个 while 循环可以有多个判断条件,但是只有最后一个才能决定是否退出循环.然而这需要一种有点不同的循环语法：
【例16】多条件的 while 循环

#!/bin/bash 
var1=unset 
previous=$var1

while echo "previous-variable = $previous" 
        echo 
        previous=$var1 
        [ "$var1" != end ] 
do
echo "Input variable #1 (end to exit) " 
read var1
echo "variable #1 = $var1" 
done
exit 0

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14

[root@localhost ~]# ./test.sh
previous-variable = unset

Input variable #1 (end to exit) 
test1
variable #1 = test1
previous-variable = unset

Input variable #1 (end to exit) 
test1
variable #1 = test1
previous-variable = test1

Input variable #1 (end to exit) 
test
variable #1 = test
previous-variable = test1

Input variable #1 (end to exit) 
end
variable #1 = end
previous-variable = test

[root@localhost ~]# 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25

通过计数器控制while循环结构

与 for 循环一样,while 循环也可通过(())来使用 C 风格语法.
【例17】C风格的 while 循环

[root@foundation0 ~]# cat test.sh 
#!/bin/bash
LIMIT=10
((a = 1)) # a=1 
# 双圆括号允许赋值两边的空格,就像 C 语言一样. 
while (( a <= LIMIT )) # 双圆括号, 变量前边没有"$". 
do 
echo -n "$a " 
((a += 1)) # let "a+=1" 
# Yes, 看到了吧. 
# 双圆括号允许像 C 风格的语法一样增加变量的值. 
done 
echo 
# 现在,C 程序员可以在 Bash 中找到回家的感觉了吧. 
exit 0 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15

运行以上程序：

[root@localhost ~]# ./test.sh
1 2 3 4 5 6 7 8 9 10 


注意:while 循环的 stdin 可以用<来重定向到文件. 
 whild 循环的 stdin 支持管道. 

    1
    2
    3
    4
    5
    6

通过结束标记控制while循环结构

在某些情况下，用户可能不知道while循环会执行多少次。此时，用户就无法使用计数器来控制while循环。为了处理这种情况，用户可以在程序中设置一个特殊的标记值，当该标记值出现时，终止while循环。这种特殊的标识值称为结束标记。
【例18】演示如何通过结束标记来控制while循环

#! /bin/bash
#提示用户输入数字
echo "Please enter a number between 1 and 10.Enter 0 to exit."
#读取用户输入的数字
read var
#while循环开始
while [[ "$var" != 0 ]]
do
   #提示用户输入数字太小
   if [ "$var" -lt 5 ]
   then
      echo "Too small. Try again."
      read var
   #提示用户输入数字太大
   elif [ "$var" -gt 5 ]
   then
      echo "Too big. Try again."
      read var;
    else
       echo "Congratulation! You are right."
       exit 0;
    fi
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23

运行以上程序

[root@localhost ~]# ./test.sh
Please enter a number between 1 and 10.Enter 0 to exit.
7
Too big.Try again.
3
Too amall.Try again.
5
Congratulation!You are right.

    1
    2
    3
    4
    5
    6
    7
    8

理解while语句与until语句的区别

语法结构非常相似，都是将循环条件放在了语句的后面：

while expression
do
...
done
until语句的语法结构如下：
unitl expression
do
...
done

    1
    2
    3
    4
    5
    6
    7
    8
    9

但是，在while语句中，当expression的值为0时才执行循环体中的语句，当expression的值为非0值时，将退出循环体；在until语句中，当expression的值为非0时，执行循环体中的语句，当expression的值为0时，将退出循环结构。因此，用户在使用这2种语句时，一定要注意区分这个关键的地方。
在执行机制方面，这2个语句是相同的，即首先会判断expression的值，当该表达式的值符合要求时，才执行循环体中的语句；否则，都不会执行循环体。
嵌套循环

在程序设计语言中，嵌套的循环也是一种非常常见的结构。Shell同样也支持嵌套循环。通过嵌套循环，可以完成更复杂的功能。本节将介绍Shell中嵌套循环的使用方法。嵌套循环就是在一个循环中还有一个循环,内部循环在外部循环体中.在外部循环的每次执行过程中都会触发内部循环,直到内部循环执行结束.外部循环执行了多少次,内部循环就完成多少次.当然,不论是外部循环或内部循环的 break 语句都会打断处理过程.
【例19】使用2层循环打印出乘法表

#! /bin/bash

#外层循环
for ((i=1;i<=9;i++))
do
   	#内层循环
   	for ((j=1;j<=i;j++))
   	do
      		#计算2个数的乘积
      		let "product=i*j"
      		#输出乘积
      		printf "$i*$j=$product"
      		#输出空格分隔符
      		if [[ "$product" -gt 9 ]]
      		then
         		printf "   "
      		else
         		printf "    "
      		fi
   	done
   	echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1    
2*1=2    2*2=4    
3*1=3    3*2=6    3*3=9    
4*1=4    4*2=8    4*3=12   4*4=16   
5*1=5    5*2=10   5*3=15   5*4=20   5*5=25   
6*1=6    6*2=12   6*3=18   6*4=24   6*5=30   6*6=36   
7*1=7    7*2=14   7*3=21   7*4=28   7*5=35   7*6=42   7*7=49   
8*1=8    8*2=16   8*3=24   8*4=32   8*5=40   8*6=48   8*7=56   8*8=64   
9*1=9    9*2=18   9*3=27   9*4=36   9*5=45   9*6=54   9*7=63   9*8=72   9*9=81  

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

利用break和continue语句控制循环

在Shell中的循环结构中，还有2个语句非常有用，即break和continue语句。前者用于立即从循环中退出；而后者则用来跳过循环体中的某些语句，继续执行下一次循环。本节将详细介绍这2个语句的使用方法。
利用break语句控制循环

break语句的作用是立即跳出某个循环结构。break语句可以用在for、while或者until等循环语句的循环体中。
【例20】输出5以内的乘法表

#! /bin/bash
for ((i=1;i<=9;i++))
do
   for ((j=1;j<=i;j++))
   do
      let "product=i*j"
      printf "$i*$j=$product"
      if [[ "$product" -gt 9 ]]
      then
         printf "   "
      else
         printf "    "
      fi
   done
   echo
   #当变量i的值为5时，退出循环
   if [[ "$i" -eq 5 ]]
   then
      break;
   fi
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1    
2*1=2    2*2=4    
3*1=3    3*2=6    3*3=9    
4*1=4    4*2=8    4*3=12   4*4=16   
5*1=5    5*2=10   5*3=15   5*4=20   5*5=25 

    1
    2
    3
    4
    5
    6

【例21】本例将【例20】中的break语句移到了内层循环中

#! /bin/bash
for ((i=1;i<=9;i++))
do
   for ((j=1;j<=i;j++))
do
      let "product=i*j"
      printf "$i*$j=$product"
      if [[    "$product" -gt 9 ]]
      then
         printf "   "
      else
         printf "    "
      fi
      #退出循环
      if [[ "$j" -eq 5 ]]
      then
         break
      fi
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1    
2*1=2    2*2=4    
3*1=3    3*2=6    3*3=9    
4*1=4    4*2=8    4*3=12   4*4=16   
5*1=5    5*2=10   5*3=15   5*4=20   5*5=25   
6*1=6    6*2=12   6*3=18   6*4=24   6*5=30   
7*1=7    7*2=14   7*3=21   7*4=28   7*5=35   
8*1=8    8*2=16   8*3=24   8*4=32   8*5=40   
9*1=9    9*2=18   9*3=27   9*4=36   9*5=45  

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

【例22】通过break语句跳出指定的层数

#! /bin/bash
for ((i=1;i<=9;i++))
do
   for ((j=1;j<=i;j++))
   do
      let "product=i*j"
      printf "$i*$j=$product"
      if [[ "$product" -gt 9 ]]
      then
         printf "   "
      else
         printf "    "
      fi
      if [[ "$j" -eq 5 ]]
      then
         #增加参数2
         break 2
      fi
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21

运行以上程序

[root@localhost ~]# ./test.sh
1*1=1    
2*1=2    2*2=4    
3*1=3    3*2=6    3*3=9    
4*1=4    4*2=8    4*3=12   4*4=16   
5*1=5    5*2=10   5*3=15   5*4=20   5*5=25   [root@localhost ~]# 

    1
    2
    3
    4
    5
    6

利用continue语句控制循环

前面介绍的break语句是退出循环体。而continue语句则比较有趣，它的作用不是退出循环体。而是跳过当前循环体中该语句后面的语句，重新从循环语句开始的位置执行。
【例23】演示continue语句的使用方法

#! /bin/bash
for var in {1..10}
do
   #如果当前数字为奇数
   if [[ "$var%2" -eq 1 ]]
   then
      #跳过后面的语句
      continue
   fi
   echo "$var"
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11

运行以上程序

[root@localhost ~]# ./test.sh
2
4
6
8
10

    1
    2
    3
    4
    5
    6

分析break语句和continue语句的区别

正如前面所讲，break语句和continue语句都可以位于各种循环体内，用于控制当前的循环流程。但是，break语句是直接退出当前的循环结构，转向执行循环体后面的语句；而continue语句则只是跳过当前循环体中continue语句后面的语句，转向当前循环体的起始位置，重新执行下一次循环，并没有退出当前的循环结构。这是这两者的最本质的区别。
另外， 没有参数的break语句和continue语句都只是影响到本层的循环流程，如果想要影响多层循环，则可以附加数字参数。
【例24】演示在双层嵌套循环中，break语句对于流程的影响

#!/bin/sh
#外层循环
for i in a b c d
do
   echo -n "$i "
   #内层循环
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         break
      fi
      echo -n "$j "
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15

运行以上程序

[root@localhost ~]# ./test.sh
a 1 2 3 4 
b 1 2 3 4 
c 1 2 3 4 
d 1 2 3 4

    1
    2
    3
    4
    5

【例25】演示通过break语句跳出指定的层数

#!/bin/sh
for i in a b c d
do
   echo -n "$i "
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         #指定跳出层数2
         break 2
      fi
      echo -n "$j "
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14

运行以上程序

[root@localhost ~]# ./test.sh
a 1 2 3 4 [root@localhost ~]# 

    1
    2

【例26】演示通过break语句跳出指定的层数

[root@foundation0 ~]# cat test.sh 
#!/bin/bash 
# break-levels.sh: 退出循环. 
# "break N" 退出 N 层循环. 
for outerloop in 1 2 3 4 5 
do 
	echo -n "Group $outerloop: " 
# -------------------------------------------------------- 
	for innerloop in 1 2 3 4 5 
	do 
	echo -n "$innerloop " 
		if [ "$innerloop" -eq 3 ] 
			then 
			break  # 试试 break 2 来看看发生什么. 
# (内部循环和外部循环都被退出了.) 
		fi 
	done 
# -------------------------------------------------------- 
	echo 
done 
echo 
exit 0 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22

运行以上程序

[root@localhost ~]# ./test.sh
Group 1: 1 2 3 
Group 2: 1 2 3 
Group 3: 1 2 3 
Group 4: 1 2 3 
Group 5: 1 2 3 

    1
    2
    3
    4
    5
    6
    7

【例27】演示通过break语句跳出指定的层数

[root@foundation0 ~]# cat test.sh 
#!/bin/bash 
# break-levels.sh: 退出循环. 
# "break N" 退出 N 层循环. 
for outerloop in 1 2 3 4 5 
do 
	echo -n "Group $outerloop: " 
# -------------------------------------------------------- 
	for innerloop in 1 2 3 4 5 
	do 
	echo -n "$innerloop " 
		if [ "$innerloop" -eq 3 ] 
			then 
			break 2 # 试试 break 2 来看看发生什么. 
# (内部循环和外部循环都被退出了.) 
		fi 
	done 
# -------------------------------------------------------- 
	echo 
done 
echo 
exit 0 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22

运行以上程序

[root@localhost ~]# ./test.sh
Group 1: 1 2 3 

    1
    2

continue语句

continue 命令也可以带一个参数.一个不带参数的 continue 命令只去掉本次循环的剩余代码 .而 continue N 将会把 N 层循环剩余的代码都去掉,但是循环的次数不变.
【例28】演示通过continue语句跳出指定的层数

#!/bin/bash 
# "continue N" 命令, 将让 N 层的循环全部被 continue. 
for outer in I II III IV V # 外部循环
do
echo; echo -n "Group $outer: " 
# -------------------------------------------------------------------- 
for inner in 1 2 3 4 5 6 7 8 9 10 # 内部循环
do
if [ "$inner" -eq 7 ]
then
continue 2 # continue 2 层, 也就是到 outer 循环上. 
fi
echo -n "$inner " # 7 8 9 10 将不会被 echo 
done
# 如果在此处添加 echo 的话,当然也不会输出. 
done
echo; echo 
exit 0

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18

运行以上程序

[root@localhost ~]# ./test.sh

Group I:123456
Group II:123456
Group III:123456
Group IV:123456
Group V:123456

    1
    2
    3
    4
    5
    6
    7
    8

【例29】通过continue语句跳过当前循环后面的语句

#!/bin/bash
for i in a b c d
do
   echo -n "$i "
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         #跳过后面的语句
         continue
      fi
      echo -n "$j "
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14

运行以上程序

[root@localhost ~]# ./test.sh
a1 2 3 4 6 7 8 9 10 
b1 2 3 4 6 7 8 9 10 
c1 2 3 4 6 7 8 9 10 
d1 2 3 4 6 7 8 9 10 

    1
    2
    3
    4
    5

【例30】演示含有参数的continue语句的使用方法

#!/bin/sh
for i in a b c d
do
   echo -n "$i "
   for j in `seq 10`
   do
      if [ $j -eq 5 ];then
         #使用含有数字参数的continue语句
         continue 2
      fi
      echo -n "$j "
   done
   echo
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14

运行以上程序

[root@localhost ~]# ./test.sh
a1 2 3 4 b1 2 3 4 c1 2 3 4 d1 2 3 4 [root@localhost ~]#

    1
    2

【例31】演示break和continue的区别：

[root@foundation0 ~]# cat test.sh 
#!/bin/bash 
LIMIT=19 # 上限
echo 
echo "Printing Numbers 1 through 20 (but not 3 and 11)." 
a=0 
while [ $a -le "$LIMIT" ] 
do 
a=$(($a+1)) 
if [ "$a" -eq 3 ] || [ "$a" -eq 11 ] # 除了 3 和 11. 
then 
continue # 跳过本次循环剩下的语句. 
fi 
echo -n "$a " # 在$a 等于 3 和 11 的时候,这句将不会执行. 
done 

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15

运行以上程序

[root@localhost ~]# ./test.sh

Printing Numbers 1 through 20 (but not 3 and 11).
1 2 4 5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 [root@localhost ~]# 

    1
    2
    3
    4

【例32】演示break和continue的区别：

# 练习: 
# 为什么循环会打印出 20? 
# echo; echo 
# echo Printing Numbers 1 through 20, but something happens after 2. 
#########################################################
### 
# Same loop, but substituting 'break' for 'continue'. 
# 同样的循环, 但是用'break'来代替'continue'. 
# a=0 
# while [ "$a" -le "$LIMIT" ] 
# do 
# a=$(($a+1)) 
# if [ "$a" -gt 2 ] 
# then 
# break # 将会跳出整个循环. 
# fi 
# echo -n "$a " 
# done 
# echo; echo; echo 
# exit 0 
 #break 命令可以带一个参数.一个不带参数的 break 循环只能退出最内层的循环,而 break N 
#可以退出 N 层循环. 

#---------------------------------------------------------------------------------------#
#!/bin/bash 

LIMIT=19 # 上限

echo 
echo "Printing Numbers 1 through 20 (but not 3 and 11)." 
a=0
while [ $a -le "$LIMIT" ] 
do
a=$(($a+1))
if [ "$a" -eq 3 ] || [ "$a" -eq 11 ] # 除了 3 和 11. 
then
break # 跳过本次循环剩下的语句. 
fi
echo -n "$a " # 在$a 等于 3 和 11 的时候,这句将不会执行. 
done

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29
    30
    31
    32
    33
    34
    35
    36
    37
    38
    39
    40

运行以上程序

[root@localhost ~]# ./test.sh

Printing Numbers 1 through 20 (but not 3 and 11).
1 2 [root@localhost ~]# 
————————————————
版权声明：本文为CSDN博主「艾季」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_42537435/article/details/92628218

```
