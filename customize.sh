#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf


# 修改默认IP为 192.168.69.1
sed -i 's/192.168.1.1/192.168.69.1/g' openwrt/package/base-files/files/bin/config_generate
 
# 修改默认主机名
sed -i '/uci commit system/i\uci set system.@system[0].hostname='SheepNet'' openwrt/package/lean/default-settings/files/zzz-default-settings
 
# 加入编译者信息
sed -i "s/OpenWrt /smrtfish build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" openwrt/package/lean/default-settings/files/zzz-default-settings
 
# 修改默认主题
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" openwrt/feeds/luci/collections/luci/Makefile
