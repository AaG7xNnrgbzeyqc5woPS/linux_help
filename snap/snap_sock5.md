see: [stackoverflow snap-proxy](https://stackoverflow.com/questions/50584084/snap-proxy-doesn%C2%B4t-work#answer-51373148)  

# 1. snap_proxy sock5
   try:  
   
    sudo snap set system proxy.http=socks5://127.0.0.1:1080
    sudo snap set system proxy.https=socks5://127.0.0.1:1080
