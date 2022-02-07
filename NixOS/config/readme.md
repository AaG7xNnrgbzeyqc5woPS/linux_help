- 这里保存nixos的配置文件，不定期备份！
- **注意密码请勿保存在配置文件中**

# 配置文件使用方法：
```
[root@nixos:~]# cd /etc/nixos
[root@nixos:/etc/nixos]# ls
configuration.nix  desktop  hardware  hardware-configuration.nix  packages  result

nixos-rebuild build  --update
nixos-rebuild switch
```
