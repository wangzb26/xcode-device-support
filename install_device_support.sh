#!/bin/bash

echo " ====开始拉取仓库最新DeviceSupport==== "

Git_Pull=$(git pull)

echo $Git_Pull

su

echo " ====获取当前默认的Xcode==== "

Xcode_Path=$(xcode-select -p)

Device_Support_Path=$Xcode_Path"/Platforms/iPhoneOS.platform/DeviceSupport"

echo $Device_Support_Path

Git_Device_Support_Path=$(pwd)/DeviceSupport

ls_cmd=$(ls $Git_Device_Support_Path)

ls_cmd_new=$(echo ${ls_cmd// /_})

ls_cmd_new=$(echo $ls_cmd | tr ' ' '_')

ls_cmd_new=${ls_cmd_new//')_'/')\n'}

ls_cmd_new=${ls_cmd_new//'\n'/ }

for item in $ls_cmd_new; do

    Xcode_Device_Support_Dir=${item//'_'/' '}

    if [ -d "$Device_Support_Path/$Xcode_Device_Support_Dir" ]; then

        echo $Xcode_Device_Support_Dir"已存在"

    else

        sudo cp -r $(pwd)"/DeviceSupport/$Xcode_Device_Support_Dir" "$Device_Support_Path"

        echo "cp $Xcode_Device_Support_Dir -> $Device_Support_Path"

    fi

done

echo "Install Device Support Done!"