@goto :start
文件名：ActiveWin10.bat

# Key Management Services (KMS) client activation and product keys
# Windows 10/11 Enterprise LTSC 2019/2021/2024 	          M7XTQ-FN8P6-TTKYV-9D4CC-J462D
# Windows 10/11 Pro for Workstations 	                  NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
# Windows 10/11 Pro 	                                  W269N-WFGWX-YVC9B-4J6C9-T83GX

# 右键开始菜单，点击 [命令提示符 (管理员)] 或 [Windows PowerShell (管理员)]
执行下面的命令：
.\ActiveWin10.bat

:start

slmgr /upk
slmgr /skms 10.153.70.238  
slmgr /ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
slmgr /ato

slmgr -dlv

rem slmgr -xpr
