

# 1. sql server 2000 版本介绍
- 目前只有 sql server 2000 x86 中文版，iso文件是经过再打包的，sha256 = 6E50D5D2298C6F17220C16B7204D7BB4CDD9B9295477F0B4162615195EFF0957
- 这个版本是中文版，内带 Sp4补丁。
- 64位版本的 window 2003 只支持 sqlserver 2000 + sp4, 必须要打到sp4补丁
- sql server 2000 在 64位版本的 win 2003 安装 略有不同，需要手动安装。
- sql 2000 64位版本 ，没有找到。
  
# 2. sql server 2000 在  win2003（64bit） 安装 
要在 64 位操作系统上安装此应用程序，请使用以下步骤： 
浏览至 SQL Server 2000 安装点    
双击“x86\setup”子文件夹中的 setupsql.exe。 
 (注：我使用根目录下的SETUP.BAT安装成功！)

下面两个服务一般不用，不安装
安装 SQL Server 2000 分析服务：
双击“msolap\install”子文件夹中的 setup.exe。 

安装 SQL Server 2000 英语查询：
双击“mseq\x86”子文件夹中的 setup.exe。 

# 3.  SP4 安装需要两步，
1，首先需要运行 ISO安装盘上的SQL2000-KB884525-SP4-x86-CHS.EXE，解压文件到 C:\SQL2KSP4
2，进入  C:\SQL2KSP4目录中，运行 setup.bat，跟随指引完成操作！

# 4. 验证安装
启动 sql server 企业管理器，查看 服务器的属性（右键菜单中），可以看到 sql server 的版本信息
```
产品：sql server enterprise edition
产品版本是 8.00.2039(sp4)
语言：中文(中国)
```
