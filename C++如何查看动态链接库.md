see:
1. [用ldd查看C++程序的依赖库](https://blog.csdn.net/csfreebird/article/details/9200469)

ldd --help  
ldd -v file  
ldd file  
ldd file1 file2  


2. [linux下查找bin依赖的动态库之readelf使用](https://blog.csdn.net/csdn66_2016/article/details/78064208)  
**readelf -d /bin/ls**  

----------------------------------------------------------------------------
```
ldd zsh
	linux-vdso.so.1 (0x00007ffecd9d7000)
	libcap.so.2 => /usr/lib/libcap.so.2 (0x00007fcf5b4f4000)
	libdl.so.2 => /usr/lib/libdl.so.2 (0x00007fcf5b4ef000)
	libncursesw.so.6 => /usr/lib/libncursesw.so.6 (0x00007fcf5b480000)
	librt.so.1 => /usr/lib/librt.so.1 (0x00007fcf5b475000)
	libm.so.6 => /usr/lib/libm.so.6 (0x00007fcf5b32f000)
	libc.so.6 => /usr/lib/libc.so.6 (0x00007fcf5b168000)
	/lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fcf5b620000)
	libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fcf5b144000)

---------------------------------------------------------------------------
ldd zsh zstdmt
zsh:
	linux-vdso.so.1 (0x00007ffc321c5000)
	libcap.so.2 => /usr/lib/libcap.so.2 (0x00007fda91611000)
	libdl.so.2 => /usr/lib/libdl.so.2 (0x00007fda9160c000)
	libncursesw.so.6 => /usr/lib/libncursesw.so.6 (0x00007fda9159d000)
	librt.so.1 => /usr/lib/librt.so.1 (0x00007fda91592000)
	libm.so.6 => /usr/lib/libm.so.6 (0x00007fda9144c000)
	libc.so.6 => /usr/lib/libc.so.6 (0x00007fda91285000)
	/lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fda9173d000)
	libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fda91261000)
zstdmt:
	linux-vdso.so.1 (0x00007fff871fc000)
	libz.so.1 => /usr/lib/libz.so.1 (0x00007fa0c7400000)
	liblzma.so.5 => /usr/lib/liblzma.so.5 (0x00007fa0c73d8000)
	liblz4.so.1 => /usr/lib/liblz4.so.1 (0x00007fa0c73b6000)
	libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007fa0c7394000)
	libc.so.6 => /usr/lib/libc.so.6 (0x00007fa0c71cd000)
	/lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007fa0c751e000)
```



