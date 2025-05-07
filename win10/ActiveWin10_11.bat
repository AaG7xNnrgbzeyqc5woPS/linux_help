@goto :start
文件名：ActiveWin10.bat
最后修改时间: 2025-5-7

#---------------------------------------------------------------------------------------
# KMS激活和产品密钥
# Key Management Services (KMS) client activation and product keys
# 1. Windows 10/11 Enterprise LTSC 2019/2021/2024 	  M7XTQ-FN8P6-TTKYV-9D4CC-J462D
# 2. Windows 10/11 Pro for Workstations 	          NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
# 3. Windows 10/11 Pro 	                                  W269N-WFGWX-YVC9B-4J6C9-T83GX
# 4. 更多密钥见微软官网：
#    https://learn.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys?tabs=server2025%2Cwindows1110ltsc%2Cversion1803%2Cwindows81
#----------------------------------------------------------------------------------------
# 右键开始菜单，点击 [命令提示符 (管理员)] 或 [Windows PowerShell (管理员)]
执行下面的命令：
.\ActiveWin10.bat

#--------------------------------------------
# tips: 
# windows 11 如何如果跳过微软账号登录，直接建立本地用户？
在Windows 11的安装过程中，跳过网络用户设置并直接建立本地用户，可以通过以下步骤实现：
1. 使用命令行跳过网络连接
1.1   按下快捷键：在联网页面，按下Shift + F10（部分笔记本可能需要按Shift + Fn + F10），打开命令提示符窗口。
1.2   输入命令：在命令行中输入oobe\bypassnro，然后按回车键执行命令。系统将自动重启。
1.3   选择离线选项：重启后，在联网页面底部会出现“我没有Internet连接”的选项，点击此选项。
1.4   继续设置：选择“继续执行受限设置”，然后按照提示完成剩余的设置步骤，不需要联网或登录微软账号
#-----------------------------------------------------------------------------------------

:start
slmgr /upk
slmgr /skms 10.147.19.2
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /ato
slmgr -dlv
slmgr -xpr
rem slmgr -xpr
