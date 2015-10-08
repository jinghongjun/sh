#!/bin/bash

# 此文件主要用于android应用构建的gradle的工具

if [ "$gradle" ]; then
    return;
fi

export gradle="gradle.sh";

. log.sh
. code.sh
. tools.sh

echo ">>>>>>>> include gradle.sh"

# 构建APK
function build_apk () {
    gradle clean build;
}

# 安装APK
# @param $1: apk路径
# @param $2:包名
# @param $3:启动activity
function install_apk () {
    apk_file=$1;
    package_name=$;
    launch_activity=$3;
    echo apk_file: $apk_file, package_name: $package_name, launch_activity: $launch_activity;
    eval adb install -r $apk_file;
    if [ $? eq 0]; then
	echo apk install success.
    else
	eval adb uninstall $package_name;
	eval adb install $apk_file;
    fi
    eval adb shell am start -n $launch_activity;
}

# 修改版本号并提交
function modify_version_code_and_commit () {
    echo "";
}

# 添加signingconfigs
function add_signing_configs () {
    # 查找主应用程序build.gradle中defaultConfig开始和结束的行号
    get_line_number_for_search_string "defaultConfig" $global_var_main_app_build_gradle "-1";
    # defaultConfig开始的行号
    signingconfig_right_bracket_start=$?;
    echo signingconfig_right_bracket_start: $signingconfig_right_bracket_start;
    # defaultConfig结束的行号
    for number in `grep -n "}" $global_var_main_app_build_gradle | cut -d ":" -f 1`; do
	# builde.gradle中"}"所在的行数
	echo number: $number;
	if [ $number -gt $signingconfig_right_bracket_start ]; then
	    signingconfig_right_bracket_end=$number;
	    break
	fi
    done
    echo signingconfig_right_bracket_end: $signingconfig_right_bracket_end;
    
    
}

# 增加编译配置


# 获取APP的版本名称
function get_version_name () {
    echo "";
}

# 
echo "<<<<<<<< include gradle.sh"
