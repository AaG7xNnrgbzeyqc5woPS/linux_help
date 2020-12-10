# letsencrypt 免费证书申请

** 使用acme.sh 手工模式申请 免费域名证书 **

# see:
https://github.com/acmesh-official/acme.sh  
https://github.com/acmesh-official/acme.sh/wiki/dns-manual-mode  
https://crt.sh/?q=kvasar.top   
https://letsencrypt.org/zh-cn/  

# 域名: w1.kvasar.top


# 申请步骤：
```
1.
acme.sh --issue -d w1.kvasar.top --dns \
 --yes-I-know-dns-manual-mode-enough-go-ahead-please

2.  
https://www.namesilo.com 
增加一条 TXT 记录
  _acme-challenge.w1.kvasar.top. IN	TXT	"bRLp9uOA7atIy4owzGvdN-3UavNU5KHdlCAgRlsPQC8"

3. repeat check,
dig  -t txt  _acme-challenge.w1.kvasar.top @8.8.8.8 

dig  -t txt  _acme-challenge.w1.kvasar.top @8.8.8.8 | grep TXT
;_acme-challenge.w1.kvasar.top.	IN	TXT
_acme-challenge.w1.kvasar.top. 7178 IN	TXT	"bRLp9uOA7atIy4owzGvdN-3UavNU5KHdlCAgRlsPQC8"


4.
acme.sh --renew -d w1.kvasar.top --dns \
 --yes-I-know-dns-manual-mode-enough-go-ahead-please
 
5.
root@localhost:~/.acme.sh/w1.kvasar.top# ls -l
total 28
-rw-r--r-- 1 root root 1587 Dec 10 13:05 ca.cer
-rw-r--r-- 1 root root 3425 Dec 10 13:05 fullchain.cer
-rw-r--r-- 1 root root 1838 Dec 10 13:05 w1.kvasar.top.cer
-rw-r--r-- 1 root root  633 Dec 10 13:05 w1.kvasar.top.conf
-rw-r--r-- 1 root root  972 Dec 10 13:05 w1.kvasar.top.csr
-rw-r--r-- 1 root root  208 Dec 10 13:05 w1.kvasar.top.csr.conf
-rw-r--r-- 1 root root 1679 Dec  8 13:02 w1.kvasar.top.key

6. https://crt.sh/?q=kvasar.top
crt.sh ID 	 Logged At  ⇧ 	Not Before 	Not After 	Common Name 	Matching Identities 	Issuer Name
3761458498 	2020-12-10 	2020-12-10 	2021-03-10 	w1.kvasar.top 	w1.kvasar.top 	C=US, O=Let's Encrypt, CN=R3
3761453984 	2020-12-10 	2020-12-10 	2021-03-10 	w1.kvasar.top 	w1.kvasar.top 	C=US, O=Let's Encrypt, CN=R3
3731053565 	2020-12-03 	2020-12-03 	2021-03-03 	w1.kvasar.top 	w1.kvasar.top 	C=US, O=Let's Encrypt, CN=R3
3731053566 	2020-12-03 	2020-12-03 	2021-03-03 	w1.kvasar.top 	w1.kvasar.top 	C=US, O=Let's Encrypt, CN=R3
2687983867 	2020-04-10 	2020-04-10 	2020-07-09 	t11.kvasar.top 	t11.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3
2687973538 	2020-04-10 	2020-04-10 	2020-07-09 	t11.kvasar.top 	t11.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3
2677938776 	2020-04-07 	2020-04-07 	2020-07-06 	t2.kvasar.top 	t2.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3
2677302132 	2020-04-07 	2020-04-07 	2020-07-06 	t2.kvasar.top 	t2.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3
2677565444 	2020-04-07 	2020-04-07 	2020-07-06 	t1.kvasar.top 	t1.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3
2677867974 	2020-04-07 	2020-04-07 	2020-07-06 	t1.kvasar.top 	t1.kvasar.top 	C=US, O=Let's Encrypt, CN=Let's Encrypt Authority X3

7. ok!

 ```
# 证书申请成功！ 测试通过！
