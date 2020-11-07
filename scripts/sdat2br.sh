#!/bin/bash

if 
  [ -e './DAT/system.new.dat' ];
then
  echo "开始转换system.new.dat到system.new.dat.br"
  ./bin/brotli -0 ./DAT/system.new.dat
  echo "成功转换system.new.dat到system.new.dat.br"
  echo "已将转换后的文件输出至DAT/system.new.dat.br"
else
  echo "DAT/system.new.dat不存在!"
fi