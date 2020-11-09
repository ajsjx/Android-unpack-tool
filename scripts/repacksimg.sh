#!/bin/bash

echo "脚本来源于迷路的小新大大"

echo "
开始打包

当前img大小为: 

_________________

`du -sh ./IMG/out/system | awk '{print $1}'`

`du -sm ./IMG/out/system | awk '{print $1}' | sed 's/$/&M/'`

`du -sb ./IMG/out/system | awk '{print $1}' | sed 's/$/&B/'`
_________________

使用G为单位打包时必须带单位且为整数
使用B为单位打包时无需带单位且在自动识别的大小添加一定大小
推荐用M为单位大小进行打包需带单位且在自动识别的大小添加至少130M大小
"

read -p "请输入要打包的数值: " size

M="$(echo "$size" | sed 's/M//g')"
G="$(echo "$size" | sed 's/G//g')"

if [ $(echo "$size" | grep 'M') ];then
 ssize=$(($M*1024*1024))
elif [ $(echo "$size" | grep 'G') ];then
 ssize=$(($G*1024*1024*1024))
else
 ssize=$size
fi

#mke2fs+e2fsdroid打包
#./bin/mke2fs -L / -t ext4 -b 4096 ./ZIP/out/system.img $size
#./bin/e2fsdroid -e -T 0 -S ./ZIP/out/config/system_file_contexts -C ./ZIP/out/config/system_fs_config  -a /system -f ./ZIP/out/system ./ZIP/out/system.img
./bin/mkuserimg_mke2fs.sh "./IMG/out/system/" "./IMG/out/system_new.img" ext4 "/system" $ssize -j "0" -T "1230768000" -C "./IMG/out/config/system_fs_config" -L "system" "./IMG/out/config/system_file_contexts" 2> ./IMG/out/error.log 
sed -i '1d' ./IMG/out/error.log

if [ -s ./IMG/out/error.log ];then
 echo "打包失败，当前错误日志为: "
 cat ./IMG/out/error.log
else
 echo "打包完成"
 rm -rf ./IMG/out/error.log
 mv ./IMG/out/system_new.img  ./IMG/system_new.img
 echo "已将system_new.img输出至IMG文件夹"
fi
