# see:
[CentOS8卸载旧版本内核 并 更新启动时内核选项grub2](https://blog.csdn.net/yy15880408695/article/details/104130524/)  
[CentOS 8 系统修复 GRUB 2 ](https://www.rultr.com/tutorials/3780.html)  
[CentOS7设置GRUB系统内核开机选单](https://blog.csdn.net/csdn_duomaomao/article/details/78963761)  

# 感想:
  终于学会修复grub2了.第一次实战! 太开心啦!

# 起因:
  Centos8 服务器升级,结果失败了,无法启动进入系统.  
  原因,仔细想想 trojan 使用了 定制内核,使用一键安装脚本,修改了内核.最有可能是这个原因.  
 
# 第一步:进入系统
  本来想重装的,因为重来没有修复过grub.登录linode控制界面,尝试重启服务器等操作,发现"Launch Console"按钮,进入控制台,
  果然看到 自动给我选择到 救援菜单,救援功能还没有用过,所以选择升级前的选项,也就是第二项,进入系统,这个完成成功!  
  非常棒!
  
# 第二步: 做做梦,想想方案
  如果服务器不管机,这点小瑕疵也没有关系.也可以接受.  
  基于完美主义,还是尝试 修复 grub2,两个方案,  
  1. 缺省选择第二项(列表从0开始,所以第二项序号是1),自动开机进入正确的内核,忽略无法启动的内核0
  2. 完全删除不能使用的内核0, 更新内核选项列表,并且选择0,(这时0内核已经是正确的了)
  
 # 第三步: 第一次尝试,小试牛刀
  1. 学习此文   
     [CentOS7设置GRUB系统内核开机选单](https://blog.csdn.net/csdn_duomaomao/article/details/78963761)
  2. 关键文件:   
     /boot/grub2/grub.cfg  
     /etc/default/grub  
     /etc/grub2.cfg -> ../boot/grub2/grub.cf  
     
  3. 关键命令一:  
     grub2-mkconfig -o /boot/grub2/grub.cfg   //根据内核文件,自动生成grub的配置文件
     
  4. 关键命令二:  
     菜单的配置有两种模式,一个是用命令方式,一个直接编辑/etc/default/grub配置文件的方式  
     4.1.  /etc/default/grub  中 GRUB_DEFAULT=saved 表示命令方式,  
           具体选择哪个选项,有下面两个命令确定  
           grub2-set-default 0      //设置内核菜单缺省为0,  
           grub2-editenv list       //查看内核菜单的设置  
     4.2. /etc/default/grub 中  
         GRUB_DEFAULT=0   //这里直接指定哪个启动选项, 0,1,2..   
         
  5. 关键文件二  
     ls /boot/   
     这里是内核文件和配置文件,每个内核有四个文件  
     config     : 这个是内核的配置  
     initramfs  : 这个是ram文件系统  
     vmlinuz   ：这个就是内核的二进制文件  
     syste.map ：这个是内核相关函数的地址  
     
   6. 删除不需要的内核文件,先要用ls看看,别删除错了.  
     ls *version*  
     rm *version*  
     
   7. 重新生成 /boot/grub2/grub.cfg  
      grub2-mkconfig -o /boot/grub2/grub.cfg  
      大胆操作  
      再用上面介绍的命令设置启动项为0  
      grub2-editenv list 看看  
      
   8. 重新启动服务器  
      还是不能进入服务器  
      进入grub2菜单,发现错误的内核菜单还在上面,阴魂不散啊  
      
# 第三步 坚持不懈,梦想成真  
   1. 搜索帮助  
      发现文章 [CentOS8卸载旧版本内核 并 更新启动时内核选项grub2](https://blog.csdn.net/yy15880408695/article/details/104130524/)
      跟我的需求类似,虽然我需要卸载的是新的内核.  
   2. 研究发现, "因为centos8用的是EFI启动方式",这句话对我不适用,因为/boot/efi/EFI/centos下没有任何文件  
   3. 发现一个关键目录:  
      /boot/loader/entries  
      我们还要把/boot/loader/entries下对应的内核版本xxx.conf删除  
   4. 删除/boot/loader/entries需要的内核条目  
   5. 重新生成配置文件  
      grub2-mkconfig -o /boot/grub2/grub.cfg   
   6. 查看启动项配置
      grub2-editenv list
   7. 重启服务器,大功告成!
   
# 总结: 
   1. 关键文件:
   /etc/default/grub        //修改这个文件  
   /etc/grub2.cfg -> ../boot/grub2/grub.cfg  //这只是个链接,也不用改  
   /boot/grub2/grub.cfg     //这个是自动生成的,不要手工改动,可以删除  
   /boot/loader/entries     //也是自动生成,不要改动,可以删除  
      
   2. 内核文件  
     ls /boot/  
     这里是内核文件和配置文件,每个内核有四个文件  
     config     : 这个是内核的配置  
     initramfs  : 这个是ram文件系统  
     vmlinuz   ：这个就是内核的二进制文件  
     syste.map ：这个是内核相关函数的地址  
           
   3. 配置文件生成:  
    grub2-mkconfig -o /boot/grub2/grub.cfg   //根据内核文件,自动生成grub的配置文件  
    
   4. 缺省配置选项  
        4.1.  配置文件: /etc/default/grub  
        4.2. 关键选项: GRUB_DEFAULT=  确定缺省启动项,取值可以是 {saved, 0,1,2,...}  
        4.3.  如果是数字,那么数字就是启动项序号,从0开始  
        4.4. 如果是 saved, 需要再用下面的命令设置:  
             grub2-set-default 0      //设置内核菜单缺省为0,  
        4.5. 如果是 saved, 设置好用 这个命令检查:   
             grub2-editenv list      
             
  The End!  
     
 
  
  
  
  
  
  
