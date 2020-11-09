#!/bin/bash

if [ -e './BR/vendor.new.dat.br' ];then
 echo "Start to unpack vendor.new.dat.br"
 brotli -d ./BR/vendor.new.dat.br
 python ./bin/sdat2img/sdat2img.py ./BR/vendor.transfer.list ./BR/vendor.new.dat ./BR/vendor.img
 mv ./BR/vendor.img ./IMG
 echo "Transform to system.img successful"
 bash ./scripts/unpackvimg.sh
else
 echo "BR/vendor.new.dat.br doesn't detected !"
fi