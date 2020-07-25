[原文](https://blog.csdn.net/beckdon/article/details/12448273)

linux下稳定性测试工具(烤机，压力测试).md

# 1. linux下压力测试常用软件：
```
stresslinux
super pi
prime
mprime
nbench
cpuburn
gamut
mersenne prime
stress
cpu burn-in
memtester
memtest86
memtest86++
System Stability Tester
BONNIE＋＋/HPL_TEST(不是专门的压力测试软件）
```
# 2. linux 测试日志
## 2.1. stress-ng 测试日志
[压力测试神器stress-ng](https://blog.csdn.net/T146lLa128XX0x/article/details/101441122)
[stress-ng Install](https://snapcraft.io/stress-ng)
[stress-ng info ](https://kernel.ubuntu.com/~cking/stress-ng/)   
[Quick Start Reference Guide](https://wiki.ubuntu.com/Kernel/Reference/stress-ng)
[stress-ng manual](https://kernel.ubuntu.com/~cking/stress-ng/stress-ng.pdf)
    
    
### 2.1.1 install stress-ng
    sudo snap install stress-ng
    
    
### 2.1.2 emample
    To run 1 instance of this for 60 seconds, use:
    stress-ng --matrix 1 -t 1m
    
    If you want to run an instance of this on ALL the CPUs on your machine, specify 0 instances and stress-ng will figure out how many to run:
    stress-ng --matrix 0 -t 1m  #run on all CPUs
    
    You can get an idea of how much user time and system (kernel) time is being used via the --times option:
    stress-ng --matrix 0 -t 1m --times  
    
    Use the --metrics-brief option to show the bogo ops. Let's see how the matrix stressor fares on a i5-3210M laptop:
    stress-ng --matrix 0 -t 60s --metrics-brief           #性能测试
    
    If you machine supports thermal zones, then stress-ng can report on the temperature at the end of a run with the --tz option, 
    for example, 60 seconds of the CPU stressor:
    stress-ng --cpu 0 --tz -t 60               # --tz  stress-ng report on the temperature
    
    
    
    
    
    
