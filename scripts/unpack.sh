#!/bin/bash

read -p "请输入要解压的压缩包名: " name
ls ./ZIP/$name

if 
  [ -e ./ZIP/out ];
then
  sudo rm -rf ./ZIP/out
fi

if 
  [ -e ./ZIP/$name ];
then
  echo "开始解压$name"
  7z x ./ZIP/$name -o./ZIP/out
  echo "解压$name完毕"
else
  echo "ZIP/$name不存在!"
fi

if 
  [ -e './ZIP/out/payload.bin' ];
then
  mv ./ZIP/out/payload.bin ./Payload
  echo "开始解压payload.bin"
  #mkdir Payload/out
  #python3 ./bin/payload/payload.py ./Payload/payload.bin ./Payload/out
  #mv ./Payload/out/system.img ./IMG/
  #mv ./Payload/out/vendor.img ./IMG/
  #rm -rf ./Payload/out/
  #rm -rf ./Payload/payload.bin
  #rm -rf ./ZIP/out
  bash ./scripts/unpackpayload.sh
  mv ./Payload/out/system.img ./IMG/
  mv ./Payload/out/vendor.img ./IMG/
  echo "解压完成，已将system.img和vendor.img移动到IMG目录，开始解压"
  bash ./scripts/unpacksimg.sh
  bash ./scripts/unpackvimg.sh
fi

if 
  [ -e ./ZIP/out/system.new.dat.br ];
then
  echo "正在解压system.new.br"
  mv ./ZIP/out/system.new.dat.br ./BR
  mv ./ZIP/out/system.transfer.list ./BR
  ./bin/brotli -d ./BR/system.new.dat.br
  python ./bin/sdat2img/sdat2img.py ./BR/system.transfer.list ./BR/system.new.dat ./BR/system.img
  mv ./BR/system.img ./IMG
  bash ./scripts/unpacksimg.sh
fi

if 
  [ -e ./ZIP/out/vendor.new.dat.br ];
then
  echo "正在解压vendor.new.br"
  mv ./ZIP/out/vendor.new.dat.br ./BR
  mv ./ZIP/out/vendor.transfer.list ./BR
  ./bin/brotli -d ./BR/vendor.new.dat.br
  python ./bin/sdat2img/sdat2img.py ./BR/vendor.transfer.list ./BR/vendor.new.dat ./BR/vendor.img
  mv ./BR/vendor.img ./IMG
  bash ./scripts/unpackvimg.sh
fi
 
if 
  [ -e './ZIP/out/system.img' ];
then
  mv ./ZIP/out/system.img ./IMG/
  bash ./scripts/unpacksimg.sh
fi

if 
  [ -e './ZIP/out/vendor.img' ];
then
  mv ./ZIP/out/vendor.img ./IMG/
  bash ./scripts/unpackvimg.sh
fi




