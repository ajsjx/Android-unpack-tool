#!/bin/bash

clear

if [ -e './ZIP' ];then
 echo "Android-unpack-tool : v1.1"
else
 bash ./scripts/mkdir.sh
 echo "Android-unpack-tool : v1.1"
fi

echo "请在root模式下运行，否则功能大概率出错"
echo "请将要解压的文件放置到各文件夹内"
echo "如需解压br请将new.dat.br和transfer.list文件放至BR文件夹"
echo "如需解压dat请将new.dat和transfer.list文件放至DAT文件夹"
echo "如需解压img请将img文件放至IMG文件夹"
echo "如需解压payload.bin请放入Payload文件夹"
echo "一键解压zip刷机包请把刷机包放入ZIP文件夹"
echo "-----------------------------"
echo "1. 解压system.new.dat.br"
echo "2. 解压system.new.dat"
echo "3. 解压system.img"
echo "4. 解压vendor.new.dat.br"
echo "5. 解压vendor.new.dat"
echo "6. 解压vendor.img"
echo "7. 全自动解压zip刷机包"
echo "8. 解压payload.bin"
echo "-----------------------------"
echo "9. simg2img"
echo "10. img2simg"
echo "-----------------------------"
echo "11. 打包system.img"
echo "12. 打包vendor.img"
echo "-----------------------------"
echo "13. 转换system.new.dat.br为system.new.dat"
echo "14. 转换system.new.dat为system.new.dat.br"
echo "15. 转换vendor.new.dat.br为vendor.new.dat"
echo "16. 转换vendor.new.dat为vendor.new.dat.br"
#echo "17. 转换system.img为system.new.dat"
#echo "18. 转换vendor.img为vendor.new.dat"
echo "-----------------------------"
echo "!. 清理目录"
echo "#. 退出程序"
echo "*. 关于该工具&帮助"
echo "¥. 安装依赖"
echo "-----------------------------"

read -p "请输入选项：" c

if [ "$c" == "#" ]; then 
  exit
elif [ "$c" == "1" ]; then 
  bash ./scripts/unpacksbr.sh  
elif [ "$c" == "2" ]; then 
  bash ./scripts/unpacksdat.sh
elif [ "$c" == "3" ]; then 
  bash ./scripts/unpacksimg.sh
elif [ "$c" == "4" ]; then 
  bash ./scripts/unpackvbr.sh
elif [ "$c" == "5" ]; then 
  bash ./scripts/unpackvdat.sh	
elif [ "$c" == "6" ]; then 
  bash ./scripts/unpackvimg.sh
elif [ "$c" == "7" ]; then 
  bash ./scripts/unpack.sh
elif [ "$c" == "8" ]; then 
  bash ./scripts/unpackpayload.sh
elif [ "$c" == "9" ]; then 
  bash ./scripts/simg2img.sh
elif [ "$c" == "10" ]; then 
  bash ./scripts/img2simg.sh
elif [ "$c" == "11" ]; then 
  bash ./scripts/repacksimg.sh
elif [ "$c" == "12" ]; then 
  bash ./scripts/repackvimg.sh
elif [ "$c" == "13" ]; then 
  bash ./scripts/sbr2dat.sh
elif [ "$c" == "14" ]; then 
  bash ./scripts/sdat2br.sh
elif [ "$c" == "15" ]; then 
  bash ./scripts/vbr2dat.sh
elif [ "$c" == "16" ]; then 
  bash ./scripts/vdat2br.sh
#elif [ "$c" == "17" ]; then 
#  bash ./scripts/img2sdat.sh
#elif [ "$c" == "18" ]; then 
#  bash ./scripts/img2sdat.sh
elif [ "$c" == "!" ]; then 
  bash ./scripts/clean.sh
elif [ "$c" == "*" ]; then 
  bash ./scripts/about.sh
elif [ "$c" == "¥" ]; then 
  bash ./setup.sh
else
  echo "好像输入不正确呢"
fi 
