#!/bin/bash

if 
  [ -e './IMG/out/system' ];
then
  echo "清理残存文件"
  sudo rm -rf ./IMG/out/system
fi

if 
  [ -e './IMG/out' ];
then
  echo "已找到目标目录"
else
  mkdir ./IMG/out
fi


if 
  [ -e './IMG/system.img' ];
then
  echo "开始解压system.img到IMG/out/system中"
  sudo python3 ./bin/imgextractor.py ./IMG/system.img ./IMG/out
  echo "system.img解压完毕"
else
  echo "IMG/system.img不存在!"
fi