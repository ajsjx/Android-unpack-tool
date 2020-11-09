#!/bin/bash

if 
  [ -e './Payload/out' ];
then
  rm -rf ./Payload/out
  mkdir ./Payload/out
else
  mkdir ./Payload/out
fi

if 
  [ -e './Payload/payload.bin' ];
then
  echo "开始解压payload.bin"
  python3 ./bin/payload/payload.py ./Payload/payload.bin ./Payload/out
  echo "解压payload.bin完成"
else
  echo "Payload/payload.bin不存在!"
fi