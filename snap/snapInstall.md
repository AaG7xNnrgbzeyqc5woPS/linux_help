  [snapInstall](https://kuricat.com/gist/snap-install-too-slow-zmbjy)
  
# 1.  追加一种来自 junkoBlog 的方法
  由于直接设置 http_proxy 环境变量无法设置上, 作者在 snapd 中直接设置 proxy, 方法如下:
    
    # 开始设置代理
    $ sudo systemctl edit snapd
    加上：
    [Service]
    Environment="http_proxy=http://127.0.0.1:port"
    Environment="https_proxy=http://127.0.0.1:port"

    #保存退出。
    $ sudo systemctl daemon-reload
    $ sudo systemctl restart snapd
