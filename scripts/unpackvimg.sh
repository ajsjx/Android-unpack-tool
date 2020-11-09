#!/bin/bash

if 
  [ -e './IMG/out/vendor' ];
then
  echo "清理残存文件"
  sudo rm -rf ./IMG/out/vendor
fi

if 
  [ -e './IMG/out' ];
then
  echo "已找到目标目录"
else
  mkdir ./IMG/out
fi

if [ -e './IMG/vendor.img' ];then
  echo "开始解压vendor.img到IMG/out/vendor中"
  sudo python3 ./bin/imgextractor.py ./IMG/vendor.img ./IMG/out
  echo "vendor.img解压完毕"
else
  echo "IMG/vendor.img不存在!"
fi