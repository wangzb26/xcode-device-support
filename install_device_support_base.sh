#!/bin/bash

if [ -d "$(pwd)/XcodeDeviceSupport" ]; then

    echo "XcodeDeviceSupport已存在"

else

    echo " ====开始拉取仓库最新DeviceSupport==== "

    Git_Clone=$(git clone https://gitee.com/LiynXu/xcode-device-support.git)

fi

cd XcodeDeviceSupport

chmod 777 install_device_support.sh

# echo "需管理员权限，请输入密码"

./install_device_support.sh
