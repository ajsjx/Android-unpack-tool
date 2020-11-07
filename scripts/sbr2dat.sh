#!/bin/bash

if 
  [ -e './BR/system.new.dat.br' ];
then
  echo "开始转换system.new.dat.br为system.new.dat"
  brotli -d ./BR/system.new.dat.br
  echo "成功转换为system.new.dat"
else
  echo "BR/system.new.dat.br不存在!"
fi