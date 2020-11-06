#!/bin/bash

if [ -e './Payload/payload.bin' ];then
 echo "Start to unpack payload.bin"
 mkdir Payload/out
 python3 ./bin/payload/payload.py ./Payload/payload.bin ./Payload/out
 echo "Unpack payload.bin successful"
else
 echo "Payload/payload.bin doesn't detected !"
fi