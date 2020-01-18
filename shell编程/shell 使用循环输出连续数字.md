
[shell 数字循环中变量的使用]{https://www.cnblogs.com/hoods/p/5054819.html}

```
shell环境，假设有一个变量NUM，需要用一个for循环输出NUM到NUM+n之间的所有值

常用做法是  

1 for a in {NUM..NUM+n}
2 do
3     echo ${a}
4 done


但是引用了变量会报错

这里{${kk}..${tt}}被当作一整个字符串了 

解决方法是用eval

1 for a in `eval echo {${kk}..$[kk+4]}`
2 do
3     echo ${a}
4 done

```

