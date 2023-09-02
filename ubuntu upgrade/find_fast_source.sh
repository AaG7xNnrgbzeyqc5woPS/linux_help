#!/bin/bash

# 获取当前的源列表
sourcelist=$(cat /etc/apt/sources.list)

# 获取可用的源列表
available_sources=$(apt-cache madison)

# 为每个源列表计算下载速度
for source in $available_sources; do
  speed=$(wget -qO- $source | grep "Average download speed:" | sed "s/Average download speed: //")
  echo "$source: $speed"
done

# 选择下载速度最快的源列表
fastest_source=$(echo "$available_sources" | sort -n | tail -n 1)

# 将最快的源列表复制到 /etc/apt/sources.list
cp $fastest_source /etc/apt/sources.list

# 更新软件包
apt update
