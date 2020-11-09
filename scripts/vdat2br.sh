#!/bin/bash

if 
  [ -e './DAT/vendor.new.dat' ];
then
  echo "开始转换vendor.new.dat到vendor.new.dat.br"
  ./bin/brotli -0 ./DAT/vendor.new.dat
  echo "成功转换vendor.new.dat到vendor.new.dat.br"
  echo "已将转换后的文件输出至DAT/vendor.new.dat.br"
else
  echo "DAT/vendor.new.dat不存在!"
fi