#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate



#在 DIY 脚本中加入对指定软件包源码的远程仓库的克隆指令。就像下面这样：
#git clone https://github.com/P3TERX/xxx package/xxx
#本地make menuconfig生成.config文件时添加相应的软件包，如果你知道包名可以直接写到.config文件中。
#TIPS: 如果额外添加的软件包与 Open­Wrt 源码中已有的软件包同名的情况，则需要把 Open­Wrt 源码中的同名软件包删除，否则会优先编译 Open­Wrt 中的软件包。
#这同样可以利用到的 DIY 脚本，相关指令应写在diy-part2.sh。
#原理是把软件包源码放到 package 目录下，编译时会自动遍历，与本地编译是一样的。当然方法不止一种，其它方式请自行探索。

git clone https://github.com/kenzok8/small-package package/small-package

#删除原openfros seeds.conf.default中对库的版本限制
sed -i 's/\^[a-z0-9]*//g' feeds.conf.default
#删除密码
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings
