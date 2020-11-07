#!/bin/bash

if 
  [ -e './IMG/out' ];
then
  rm -rf ./IMG/out
  mkdir ./IMG/out
else
  mkdir ./IMG/out
fi

read -p "要转换的镜像名,无需带.img后缀: " sm


echo "开始转换simg to img"
./bin/android-simg2img/simg2img ./IMG/$sm'.img' ./IMG/$sm'.raw.img'
echo "转换完成"


