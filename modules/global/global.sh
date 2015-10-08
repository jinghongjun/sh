#!/bin/bash

# 此文件主要用于存储全局变量，用于解决shell函数只能返回整数的问题。

if [ "$global" ]; then
    return;
fi

export global="global.sh";

. log.sh

echo ">>>>>>>> include global.sh"

# 全局变量命名规则: global_var_use
# 全局常量命名规则: global_constant_use

# 全局变量命名区
global_var_main_app_dir="";
global_var_main_app_build_gradle="";
global_var_main_app_android_manifest="";
global_var_main_app_version_name="";
global_var_main_app_version_code="";
global_var_system_function="";
global_var_find_file="";

# 初始化全局变量区域
# @param $1: 主应用目录
function init_global_var () {
    global_var_main_app_dir=$1;

    # 初始化常量区
    global_constant_current_user_name=`whoami`;
    global_constant_build_gradle="build.gradle";
    global_constant_android_manifest="AndroidManifest.xml";
    global_constant_system_function="SystemFunction.java";
    # log level: 0:verbase; 1:debug; 2:info; 3:warn 4:error
    global_constant_log_level=2;
    
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

# 查找主应用的build.gradle
#function find_build_grandle () {
#    if [ -n "$global_var_main_app_dir" ]; then
#	global_var_main_app_build_gradle=`find $global_var_main_app_dir -name $globle_constant_build_gradle`;
#    fi
#}


# 清除全局变量区域
function clear_global_var () {
    global_var_main_app_path="";
    global_var_main_app_build_gradle="";
    global_var_main_app_android_mainfest="";
    global_var_main_app_version_name="";
    global_var_main_app_version_code="";
    global_var_find_file="";
}

echo "<<<<<<<< include global.sh"
