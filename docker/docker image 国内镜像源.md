<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# docker image 国内镜像源

国内使用 Docker 时，为了加快镜像拉取速度，通常会配置国内的 Docker 镜像加速源。由于 Docker Hub 官方服务器位于国外，直接拉取镜像速度较慢且不稳定，国内多个云服务商和高校提供了镜像加速服务。下面是2024-2025年较为常用且有效的国内 Docker 镜像源及配置方法汇总。

## 常用国内 Docker 镜像源地址

| 镜像源名称 | 镜像加速地址 | 备注 |
| :-- | :-- | :-- |
| 阿里云 | `https://<your_code>.mirror.aliyuncs.com` | 需登录阿里云控制台获取专属加速地址 |
| 腾讯云 | `https://mirror.ccs.tencentyun.com` | 仅支持内网访问，适用于腾讯云服务器 |
| 网易云 | `https://hub-mirror.c.163.com` | 公共镜像加速服务 |
| 中科大 | `https://docker.mirrors.ustc.edu.cn` | 高校镜像站，稳定性较好 |
| 百度云 | `https://mirror.baidubce.com` | 公共镜像加速服务 |
| DaoCloud | `https://docker.m.daocloud.io` | 白名单模式，支持多种镜像源 |
| 七牛云 | `https://reg-mirror.qiniu.com` | 公共镜像加速服务 |
| Docker Proxy | `https://dockerproxy.com` | 支持 Docker Hub、GCR、K8S 等多源加速 |
| 南京大学 | `https://docker.nju.edu.cn` | 高校镜像站，支持多种镜像源 |
| hub.littlediary.cn | `https://hub.littlediary.cn` | 公益镜像加速站 |
| hub.rat.dev | `https://hub.rat.dev` | 公益镜像加速站 |
| 毫秒镜像 | `docker.1ms.run` | 公益镜像加速站 |

此外，还有一些其他镜像源如 `docker.mybacc.com`、`docker.xiaogenban1993.com` 等也被部分用户使用[^1][^3][^4][^5][^6]。

## 配置方法

### Linux 配置示例

编辑或创建 Docker 守护进程配置文件 `/etc/docker/daemon.json`，添加如下内容：

```json
{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://mirror.baidubce.com",
    "https://ccr.ccs.tencentyun.com",
    "https://docker.m.daocloud.io"
  ]
}
```

保存后，重启 Docker 服务使配置生效：

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

使用 `docker info` 命令查看是否成功配置：

```bash
Registry Mirrors:
https://hub-mirror.c.163.com/
https://docker.mirrors.ustc.edu.cn/
https://mirror.baidubce.com/
https://ccr.ccs.tencentyun.com/
https://docker.m.daocloud.io/
```


### Windows 和 macOS 配置

在 Docker Desktop 中：

1. 打开 Docker Desktop 设置(Settings)。
2. 进入“Docker Engine”选项卡。
3. 在 JSON 配置的 `"registry-mirrors"` 字段中添加国内镜像源地址。
4. 点击“Apply \& Restart”保存并重启 Docker。

示例配置：

```json
{
  "registry-mirrors": ["https://hub-mirror.c.163.com"]
}
```

配置完成后，同样可以通过 `docker pull` 命令验证镜像拉取速度是否提升[^2][^3][^5].

## 代理设置（可选）

如果国内镜像源仍无法满足需求，或者需要访问国外镜像，可以配置 Docker 进程走 HTTP/HTTPS 代理：

1. 创建目录 `/etc/systemd/system/docker.service.d`（如果不存在）。
2. 在该目录下新建 `proxy.conf` 文件，内容示例：
```ini
[Service]
Environment="HTTP_PROXY=http://代理服务器ip:port"
Environment="HTTPS_PROXY=http://代理服务器ip:port"
```

3. 重启 Docker 服务：
```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

通过 `docker info` 验证代理配置：

```bash
HTTP Proxy: 代理服务器ip:port
HTTPS Proxy: 代理服务器ip:port
```

这能有效避免拉取镜像时卡顿或失败的问题[^2].

## 注意事项

- 部分镜像源可能只提供官方基础镜像或白名单镜像，遇到拉取不到镜像的情况，可以尝试切换其他镜像源。
- 阿里云镜像需要登录阿里云账号，生成专属加速地址。
- 腾讯云镜像加速器主要支持腾讯云内网访问，外网访问有限制。
- 镜像源的可用性可能会变化，建议多配置几个备用镜像源。
- 合理使用公共镜像加速服务，避免滥用导致服务不稳定[^1][^4][^6].

综上，国内 Docker 镜像源众多，配置合适的加速器能显著提升镜像拉取速度，改善国内用户的使用体验。常用的镜像源包括阿里云、腾讯云、网易云、中科大、百度云、DaoCloud 等，具体可根据需求和网络环境选择配置。

<div style="text-align: center">⁂</div>

[^1]: https://github.com/dongyubin/DockerHub

[^2]: https://blog.csdn.net/Lichen0196/article/details/137355517

[^3]: https://www.cnblogs.com/yuzhihui/p/17461781.html

[^4]: https://gist.github.com/y0ngb1n/7e8f16af3242c7815e7ca2f0833d3ea6

[^5]: https://cloud.tencent.com/developer/article/2471124

[^6]: https://www.cnblogs.com/Nine4Cool/p/18499621

[^7]: https://blog.csdn.net/llc580231/article/details/139979603

[^8]: https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images

