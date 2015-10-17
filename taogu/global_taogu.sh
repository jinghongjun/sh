#!/bin/bash

# 此文件主要用于桃谷编译的常量

if [ "$global_taogu" ]; then
    return;
fi

export global_taogu="global_taogu.sh";

. log.sh

echo ">>>>>>>> include global_taogu.sh"

# 期待的版本

# Android桃谷所有应用版本
# 桃谷医院专家开发版
TAOGU_ZHUANJIA_DEV=0;
# 桃谷医院专家正式版
TAOGU_ZHUANJIA_REL=1;
# 新乡中心医院开发版
XINXIANG_DEV=2;
# 新乡中心医院正式版
XINXIANG_REL=3;
# 商丘市一院开发版
SHANGQIU_DEV=4;
# 商丘市一院正式版
SHANGQIU_REL=5;
# 桃谷医院开发版
TAOGU_DEV=6;
# 桃谷医院测试版
TAOGU_REL=7;
# 唐山人民医院开发版
TANGSHAN_DEV=8;
# 唐山人民医院正式版
TANGSHAN_REL=9;
# 开封市二院开发版
KAIFENG_DEV=10;
# 开封市二院正式版
KAIFENG_REL=11;
# 博爱妇幼保健院开发版
BOAI_DEV=12;
# 博爱妇幼保健院正式版
BOAI_REL=13;
# 安阳市中医院开发版
ANYANG_DEV=14;
# 安阳市中医院正式版
ANYANG_REL=15;
# 南阳市二院开发版
NANYANG_DEV=16;
# 南阳市二元正式版
NANYANG_REL=17;
# 平顶山市一院开发版
PINGDINGSHAN_DEV=18;
# 平顶山市医院正式版
PINGDINGSHAN_REL=19;
# 驻马店市医院开发版
ZHUMADIAN_DEV=20;
# 驻马店市医院正式版
ZHUMADIAN_REL=21;

echo "<<<<<<<< include global_taogu.sh"
