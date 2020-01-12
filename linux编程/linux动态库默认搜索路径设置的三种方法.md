# see:
[linux动态库默认搜索路径设置的三种方法](https://www.cnblogs.com/matthew-2013/p/4669366.html)


众所周知， Linux 动态库的默认搜索路径是 /lib 和 /usr/lib 。动态库被创建后，一般都复制到这两个目录中。当程序执行时需要某动态库， 并且该动态库还未加载到内存中，则系统会自动到这两个默认搜索路径中去查找相应的动态库文件，然后加载该文件到内存中，这样程序就可以使用该动态库中的函 数，以及该动态库的其它资源了。在 Linux 中，动态库的搜索路径除了默认的搜索路径外，还可以通过以下三种方法来指定。

方法一：在配置文件 /etc/ld.so.conf 中指定动态库搜索路径。每次编辑完该文件后，都必须运行命令 ldconfig 使修改后的配置生效 。我们通过例 1 来说明该方法。
例 1 ：
我们通过以下命令用源程序 pos_conf.c （见程序 1 ）来创建动态库 libpos.so ，
```
# gcc –fpic -shared -o libpos.so pos_conf.c
```
接着通过以下命令编译 main.c （见程序 2 ）生成目标程序 pos 。
```
# gcc -o pos main.c -L. -lpos
```
方法二：通过环境变量 LD_LIBRARY_PATH 指定动态库搜索路径。
方法三：在编译目标代码时指定该程序的动态库搜索路径。
还可以在编译目标代码时指定程序的动态库搜索路径。 -Wl, 表示后面的参数将传给 link 程序 ld （因为 gcc 可能会自动调用ld ）。这里通过 gcc 的参数 "-Wl,-rpath," 指定（如例 3 所示）。当指定多个动态库搜索路径时，路径之间用冒号 " ： " 分隔。
例 3 ：
我们通过以下命令用源程序 pos.c （见程序 4 ）来创建动态库 libpos.so 。
```
# gcc -c pos.c
# gcc -shared -fic -o libpos.so pos.o
#
```
因为我们需要在编译目标代码时指定可执行文件的动态库搜索路径，所以需要用 gcc 命令重新编译源程序 main.c( 见程序 2) 来生成可执行文件 pos 。
```
# gcc -o pos main.c -L. -lpos -Wl,-rpath=.:..:lib
#
```

搜索动态库的先后顺序
编译目标代码时指定的动态库搜索路径
```
LD_LIBRARY_PATH
/etc/ld.so.cache
default path /lib, and then /usr/lib.
```


