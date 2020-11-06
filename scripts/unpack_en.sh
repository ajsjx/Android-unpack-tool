#!/bin/bash

echo "Unpacking ZIP..."

if [ -e './ZIP/out' ];then
 rm -rf ./ZIP/out
fi

if [ -e './ZIP/update.zip' ];then
 chmod 777 ZIP/update.zip
 mkdir ZIP/out
 unzip -d ZIP/out ZIP/update.zip
else
 echo "ZIP/update.zip doesn't detected!"
fi

if [ -e './ZIP/out/payload.bin' ];then
 mv ./ZIP/out/payload.bin ./Payload
 echo "Start to unpack payload.bin"
 mkdir Payload/out
 python3 ./bin/payload/payload.py ./Payload/payload.bin ./Payload/out
 mv ./Payload/out/system.img ./IMG/
 mv ./Payload/out/vendor.img ./IMG/
#rm -rf ./Payload/out/
 rm -rf ./Payload/payload.bin
 rm -rf ./ZIP/out
 echo "Unpack successful,already place system.img and vendor.img to IMG folder,stat to unpack"
 bash ./scripts/unpacksimg.sh
 bash ./scripts/unpackvimg.sh
fi

if [ -e ./ZIP/out/system.new.dat.br ];then
  echo "Unpacking system.new.br"
  mv ./ZIP/out/system.new.dat.br ./BR
  mv ./ZIP/out/system.transfer.list ./BR
  brotli -d ./BR/system.new.dat.br
  python ./bin/sdat2img/sdat2img.py ./BR/system.transfer.list ./BR/system.new.dat ./BR/system.img
  mv ./BR/system.img ./IMG
  echo "Unpacking vendor.new.br"
  mv ./ZIP/out/vendor.new.dat.br ./BR
  mv ./ZIP/out/vendor.transfer.list ./BR
  brotli -d ./BR/vendor.new.dat.br
  python ./bin/sdat2img/sdat2img.py ./BR/vendor.transfer.list ./BR/vendor.new.dat ./BR/vendor.img
  mv ./BR/vendor.img ./IMG
  rm -rf ./BR/*
  bash ./scripts/unpacksimg.sh
  bash ./scripts/unpackvimg.sh
  rm -rf ./ZIP/out
 fi
 
if [ -e './ZIP/out/system.img' ];then
 mv ./ZIP/out/system.img ./IMG/
 bash ./scripts/unpacksimg.sh
fi

if [ -e './ZIP/out/vendor.img' ];then
 mv ./ZIP/out/vendor.img ./IMG/
 bash ./scripts/unpackvimg.sh
fi




