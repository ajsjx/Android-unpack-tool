#!/bin/bash

read -p "要转换的镜像名,无需带.img后缀: " im

if 
  [ -e './IMG/out' ];
then
  rm -rf ./IMG/out
  mkdir ./IMG/out
else
  mkdir ./IMG/out
fi


echo "开始转换img to simg"
./bin/android-simg2img/img2simg ./IMG/$im.img ./IMG/$im.space.img
echo "转换完成"
