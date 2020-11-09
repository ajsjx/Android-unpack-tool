#!/bin/bash

if 
  [ -e './BR/vendor.new.dat.br' ];
then
  echo "开始转换vendor.new.dat.br为vendor.new.dat"
  brotli -d ./BR/vendor.new.dat.br
  echo "成功转换为vendor.new.dat"
else
  echo "BR/vendor.new.dat.br不存在!"
fi