#!/bin/bash

if [ -e './BR/system.new.dat.br' ];then
 echo "Start to unpack system.new.dat.br"
 brotli -d ./BR/system.new.dat.br
 python ./bin/sdat2img/sdat2img.py ./BR/system.transfer.list ./BR/system.new.dat ./BR/system.img
 mv ./BR/system.img ./IMG
 echo "Transform to system.img successful"
 bash ./scripts/unpacksimg.sh
else
 echo "BR/system.new.dat.br doesn't detected!"
fi