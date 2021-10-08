
# 0. See:
 - [如何评价NixOS?](https://www.zhihu.com/question/56543855/answer/491883533)   


然后发现自己 Bash script 连 Hello World 都不会写了，
最后发现只有将 shehang 写成 #!/usr/bin/env bash 才可以跑（没错，/usr/bin 下就只有一个 env 而且是链接到 /nix/store/...-coreutils-x.yz/bin/env 的）。

# 1. Run Bash Script:
Bash Script第一行要写成：
```
#!/usr/bin/env bash
```
