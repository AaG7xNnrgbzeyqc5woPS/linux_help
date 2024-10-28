# See:
- [Linux 用户和用户组管理](https://www.runoob.com/linux/linux-user-manage.html)
- [如何在Linux上创建没有密码的用户](https://www.codenong.com/2-how-to-create-a-user-without-password-in-linux/)
- [Change linux password in a script, quietly](https://stackoverflow.com/questions/15023432/change-linux-password-in-a-script-quietly)
- [Creating a user without a password](https://unix.stackexchange.com/questions/56765/creating-a-user-without-a-password)
- [How to Handle Account Passwords in Linux With passwd Command](https://linuxhandbook.com/passwd-command/)
- [How to Change, Remove, or Disable User Password in Linux](https://linuxiac.com/how-to-change-remove-disable-user-password-in-linux/)
- [How do I create a blank user password in Linux?](http://kb.eclipseinc.com/kb/how-do-i-create-a-blank-user-password-in-linux/)

#  switch to root
- 如果一个用户同时属于多个用户组，那么用户可以在用户组之间切换，以便具有其他用户组的权限。
用户可以在登录后，使用命令newgrp切换到其他用户组，这个命令的参数就是目的用户组。例如：
```
$ sudo newgrp root
```
