#!/bin/bash

if 
  [ -e './DAT/vendor.new.dat' ];
then
  python ./bin/sdat2img/sdat2img.py ./DAT/vendor.transfer.list ./DAT/vendor.new.dat ./DAT/vendor.img
  mv ./DAT/vendor.img ./IMG
  echo "成功转换为vendor.img"
  bash ./scripts/unpackvimg.sh
else
  echo "DAT/vendor.new.dat不存在！"
fi