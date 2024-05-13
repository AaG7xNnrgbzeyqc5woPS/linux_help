

# 1. sql server 2000 版本介绍
- 目前只有 sql server 2000 x86 中文版，iso文件是经过再打包的，sha256 = 6E50D5D2298C6F17220C16B7204D7BB4CDD9B9295477F0B4162615195EFF0957
- 这个版本是中文版，内带 Sp4补丁。
- window 2003 只支持 sqlserver 2000 + sp4, 必须要打到sp4补丁
- 
- sql 2000 64位版本 ，没有找到。
  
# 2. 
要在 64 位操作系统上安装此应用程序，请使用以下步骤： 
浏览至 SQL Server 2000 安装点    
双击“x86\setup”子文件夹中的 setupsql.exe。 

 (被注：我使用根目录下的SETUP.BAT安装成功！)


安装 SQL Server 2000 分析服务：
双击“msolap\install”子文件夹中的 setup.exe。 

安装 SQL Server 2000 英语查询：
双击“mseq\x86”子文件夹中的 setup.exe。 


SP4 安装需要两步，
1，首先需要运行 ISO安装盘上的SQL2000-KB884525-SP4-x86-CHS.EXE，解压文件到 C:\SQL2KSP4
2，进入  C:\SQL2KSP4目录中，运行 setup.bat，跟随指引完成操作！
