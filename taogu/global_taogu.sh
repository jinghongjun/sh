#!/bin/bash

# 此文件主要用于桃谷编译的常量

if [ "$global_taogu" ]; then
    return;
fi

export global_taogu="global_taogu.sh";

. log.sh

echo ">>>>>>>> include global_taogu.sh"

# log level: 0:verbase; 1:debug; 2:info; 3:warn 4:error
global_constant_log_level=2;

# Android桃谷所有应用版本
# 注意: 如果有新增的医院,请完善以下列表并添加相应类型保持顺序
# 例如：新增xxx医院
#       xxxx_DEV=数字;
#       xxxx_REL=数字;
################################# TARGET_BUILD_ID #####################################
EXIT=0;
# 桃谷医院专家开发版
TAOGU_ZHUANJIA_DEV=1;
# 桃谷医院专家正式版
TAOGU_ZHUANJIA_REL=2;
# 新乡中心医院开发版
XINXIANG_DEV=3;
# 新乡中心医院正式版
XINXIANG_REL=4;
# 商丘市一院开发版
SHANGQIU_DEV=5;
# 商丘市一院正式版
SHANGQIU_REL=6;
# 桃谷医院开发版
TAOGU_DEV=7;
# 桃谷医院正式版
TAOGU_REL=8;
# 唐山人民医院开发版
TANGSHAN_DEV=9;
# 唐山人民医院正式版
TANGSHAN_REL=10;
# 开封市二院开发版
KAIFENG_DEV=11;
# 开封市二院正式版
KAIFENG_REL=12;
# 博爱妇幼保健院开发版
BOAI_DEV=13;
# 博爱妇幼保健院正式版
BOAI_REL=14;
# 安阳市中医院开发版
ANYANG_DEV=15;
# 安阳市中医院正式版
ANYANG_REL=16;
# 南阳市二院开发版
NANYANG_DEV=17;
# 南阳市二院正式版
NANYANG_REL=18;
# 平顶山市一院开发版
PINGDINGSHAN_DEV=19;
# 平顶山市医院正式版
PINGDINGSHAN_REL=20;
# 驻马店市医院开发版
ZHUMADIAN_DEV=21;
# 驻马店市医院正式版
ZHUMADIAN_REL=22;
####################################################################################

############################### TARGET_BUILD_TYPE ##################################
TARGET_BUILD_TYPE_DEV="DEV";
TARGET_BUILD_TYPE_REL="REL";

###############################      YES/NO       ##################################

global_var_main_app_dir="";
global_var_main_app_build_gradle="";
global_var_main_app_android_manifest="";
global_var_main_app_version_name="";
global_var_main_app_version_code="";
global_var_system_function="";


# 初始化全局变量区域
# @param $1: 主应用目录
function init_global_var () {
    global_var_main_app_dir=$1;

    # 初始化常量区
    global_constant_current_user_name=`whoami`;
    global_constant_build_gradle="build.gradle";
    global_constant_android_manifest="AndroidManifest.xml";
    global_constant_system_function="SystemFunction.java";

    # 主应用build.gradle
    find_file $global_var_main_app_dir $global_constant_build_gradle;
    global_var_main_app_build_gradle=$global_var_find_file;
    # 主应用AndroidMainfest.xml
    find_file $global_var_main_app_dir $global_constant_android_manifest;
    global_var_main_app_android_manifest=$global_var_find_file;
    # SystemFunction.java
    find_file "./" $global_constant_system_function;
    global_var_system_function=$global_var_find_file;

    i "global_var_main_app_dir: $global_var_main_app_dir, global_var_main_app_build_gradle: $global_var_main_app_build_gradle, global_var_main_app_android_manifest: $global_var_main_app_android_manifest, global_var_system_function: $global_var_system_function";
    
}


# 清除全局变量区域
function clear_global_var () {
    global_var_main_app_path="";
    global_var_main_app_build_gradle="";
    global_var_main_app_android_mainfest="";
    global_var_main_app_version_name="";
    global_var_main_app_version_code="";
    global_var_find_file="";
}

echo "<<<<<<<< include global_taogu.sh"
