#!/bin/bash

if [ -e ./IMG/vendor.img ];then
 mkdir -p ./IMG/out/vendor
 echo "Start to unpack vendor.img"
 7z x ./IMG/vendor.img -oIMG/out/vendor
 echo "Unpack vendor.img successful"
else
 echo "IMG/vendor.img doesn't detected !"
fi

