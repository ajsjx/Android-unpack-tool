#!/bin/bash

if 
  [ -e './DAT/system.new.dat' ];
then
  python ./bin/sdat2img/sdat2img.py ./DAT/system.transfer.list ./DAT/system.new.dat ./DAT/system.img
  mv ./DAT/system.img ./IMG
  echo "成功转换为system.img"
  bash ./scripts/unpacksimg.sh
else
  echo "DAT/system.new.dat不存在！"
fi