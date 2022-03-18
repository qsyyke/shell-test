#!/bin/bash
 # 各类配置信息
 bucket="sample" # 云存储服务的名称
 remote_path="default/" # 上传默认的路径
 auth="xxxxxxx" # 操作员名和操作员密码按照operator:password拼接Base64编码
 base_url="https://xxx.xxx.xx/" # 对象存储绑定的域名

 # 上传图片
 for i in "$@"; do
     curl https://v0.api.upyun.com/"$bucket"/"$remote_path" -H "Authorization: Basic ""$auth" --upload-file "$i"
 done
 # 输出结果
 echo "Upload Success:"
 for file in "$@"; do
     IFS='/' read -r -a array <<< "$file"
     id="${#array[@]}"
     echo "$base_url""$remote_path""${array[$id-1]}"
 done
