  [原文](https://ywnz.com/linuxml/4889.html)
  
# 1. 在Linux中监控CPU温度

  对于CPU临时值，我们将把watch与sensors命令结合起来，在这里使用终端版本：
  watch -n 2 sensors
  
# 2. 监控Linux中的GPU温度
  Nvidia显卡, 安装驱动程序后，将拥有Nvidia X Server gui应用程序以及命令行实用程序nvidia-smi（Nvidia系统管理界面），所以我们将使用watch和nvidia-smi：
  watch -n 2 nvidia-smi
