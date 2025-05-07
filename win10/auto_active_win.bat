@echo off
setlocal enabledelayedexpansion

:: 管理员权限检查
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo 正在提升权限...
    powershell -Command "Start-Process cmd -ArgumentList '/c ""%~s0""' -Verb RunAs"
    exit /b
)

:: 系统信息获取
for /f "tokens=4 delims=[.] " %%a in ('ver') do set OS_Version=%%a
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID ^| find "EditionID"') do set EditionID=%%a

:: GVLK匹配
set GVLK=
if "%EditionID%"=="Enterprise" (
    if "%OS_Version%"=="10.0" set GVLK=NPPR9-FWDCX-D2C8J-H872K-2YT43
    if "%OS_Version%"=="6.3" set GVLK=MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
    if "%OS_Version%"=="6.1" set GVLK=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
)
if "%EditionID%"=="Professional" (
    if "%OS_Version%"=="10.0" set GVLK=W269N-WFGWX-YVC9B-4J6C9-T83GX
    if "%OS_Version%"=="6.3" set GVLK=GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
)
if "%EditionID%"=="ServerStandard" set GVLK=PTXN8-JFHJM-4WC78-MPCBR-9W4KR
if "%EditionID%"=="ServerDatacenter" set GVLK=2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG

:: 密钥验证
if not defined GVLK (
    echo 不支持的版本: %EditionID%
    pause
    exit /b 1
)

:: 激活流程
echo 正在安装密钥: %GVLK%
cscript //nologo %windir%\system32\slmgr.vbs /ipk %GVLK%
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo 配置KMS服务器: 10.147.19.2
cscript //nologo %windir%\system32\slmgr.vbs /skms 10.147.19.2
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo 正在激活...
cscript //nologo %windir%\system32\slmgr.vbs /ato
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

:: 状态验证
echo 激活状态验证:
cscript //nologo %windir%\system32\slmgr.vbs /xpr

endlocal
pause
