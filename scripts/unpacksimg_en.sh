#!/bin/bash

if [ -e ./IMG/system.img ];then
 mkdir -p ./IMG/out/system
 echo "Start to unpack system.img"
 7z x ./IMG/system.img -oIMG/out/system
 echo "Unpack system.img successful"
else
 echo "IMG/system.img doesn't detected !"
fi

