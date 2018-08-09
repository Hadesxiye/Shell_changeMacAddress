#!/bin/bash
echo ""
echo "❀--               (*ﾟ∀ﾟ)Start                   --❀"
echo "|                                                 |"
echo "|                 create by hades                 |"
echo "|                                                 |"
echo "❀--  只能修改ARP中的Mac地址信息，重启电脑后失效 --❀"
echo ""
echo ""
newMac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
echo ""
echo "        ❗️🔞⚠️ new MacAddress = $newMac        "
echo ""
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z 
sudo ifconfig en0 ether $newMac

networksetup -detectnewhardware
ifconfig
echo "        请自行校验 en0 对应的 ether 是否变成给出的 new MacAddress    "
echo "             如果失败，请检查密码是否输错                            "
echo "❀                     End                         ❀"
echo ""