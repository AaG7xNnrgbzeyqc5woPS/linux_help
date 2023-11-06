- [download-windows10ISO](https://www.microsoft.com/zh-cn/software-download/windows10ISO)

windows10ISO
# 验证ISO
```
如果您想验证下载数据的完整性和真实性，请按照以下步骤操作：

下载所需产品 ISO 文件，并按照安装指南进行操作。
开启 Windows PowerShell。如果您需要查找操作系统中 PowerShell 的位置，请单击此处查看帮助。
在 PowerShell 中，使用 Get-FileHash cmdlet 计算您下载的 ISO 文件的哈希值。例如：
Get-FileHash C:\Users\用户1\Downloads\Contoso8_1_ENT.iso
如果 SHA256 输出结果与下表中的数值相符，即可确认您下载产品的文件未遭到破坏、篡改或与原文件有差别。
其他详细信息，请通过 Get-FileHash 命令获取。
```
| 语言       | 64/32bit |                sha256                                           |
|:----------|:--------:|:---------------------------------------------------------------:|
| 简体中文    | 64-bit	| D485D370406CBCB68959718817BD12ED87E537A14C885F84962E07136FC4A049 |
| 简体中文    | 32-bit	| C828ACCB08886622F5E1A127BB83070BAE0E9235EF0E31573ABC6A8A5CB55286 |
| 繁体中文    | 64-bit	| C9594113B52F96783FB6CA8248EBBC972277E26FB215C302BFCCE50DF6C21A79 |
| 繁体中文    | 32-bit	| 62E61916A5BC6F6B7EB75D132583C4131AB81E4A19038DE527918324585720EE |
| 英语       | 64-bit	| A6F470CA6D331EB353B815C043E327A347F594F37FF525F17764738FE812852E |
| 英语       | 32-bit	| AC0B7045B6C3A72A4D46DAAB0944E109A55D9EDE3A11B775FDB57C2DD3FCA2EF |
| 英语（国际） | 64-bit	| EDC53C5C5FE6926DEA23FC3E884FBCF78CC2B9E76364BE968F806FC6D42B59D2 |
| 英语（国际） | 32-bit	| 38D093AE08BF80302B900BC91A2CE5205C5086DDEEFAB29E8D529D5607B6B4DB |
