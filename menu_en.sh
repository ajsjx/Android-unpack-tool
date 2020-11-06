#!/bin/bash

clear

if [ -e './ZIP' ];then
 echo "Android-unpack-tool : v1.0"
else
 bash ./scripts/mkdir_en.sh
 echo "Android-unpack-tool : v1.0"
fi

echo "Please place files into correct folders."
echo ""
echo "1. Unpack system.new.dat.br"
echo "2. Unpack system.new.dat(Has not been updated.)"
echo "3. Unpack system.img"
echo "4. Unpack vendor.new.dat.br"
echo "5. Unpack vendor.new.dat(Has not been updated.)"
echo "6. Unpack vendor.img"
echo "7. Automatic unpack ROM zip"
echo "8. unpack payload.bin"
echo ""
echo "!. Clean folder"
echo "#. Exit program"
echo "*. About & Help"
echo "¥. Install depends"

read -p "Please type the options：" c

if [ "$c" == "#" ]; then 
    exit
elif [ "$c" == "1" ]; then 
	bash ./scripts/unpacksbr_en.sh  
elif [ "$c" == "2" ]; then 
	bash ./scripts/unpacksdat_en.sh
elif [ "$c" == "3" ]; then 
	bash ./scripts/unpacksimg_en.sh
elif [ "$c" == "4" ]; then 
	bash ./scripts/unpackvbr_en.sh
elif [ "$c" == "5" ]; then 
	bash ./scripts/unpackvdat_en.sh	
elif [ "$c" == "6" ]; then 
	bash ./scripts/unpackvimg_en.sh
elif [ "$c" == "7" ]; then 
	bash ./scripts/unpack_en.sh
elif [ "$c" == "8" ]; then 
	bash ./scripts/unpackpayload_en.sh
elif [ "$c" == "!" ]; then 
	bash ./scripts/clean_en.sh
elif [ "$c" == "*" ]; then 
	bash ./scripts/about_en.sh
elif [ "$c" == "¥" ]; then 
	bash ./setup_en.sh
else
	echo "Type wrong try again."
fi 
