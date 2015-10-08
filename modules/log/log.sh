#!/bin/bash

# 此文件用于日志工具

if [ "$log" ]; then
    return;
fi

export log="log.sh";

echo ">>>>>>>> inculde log.sh"

# 日志级别
# v(verbose-black) < d(debug->blue) < i(info->green) < w(warn->yellow) < e(error->red) 

# 字体设置说明
# shell echo 显示内容带颜色需要使用echo -e
# echo -e "\033[字背景颜色;文字颜色m 字符串 \033[0m"
# 字体颜色: 30:黑色; 31:红色; 32:绿色; 33:黄色; 34蓝色; 35:紫色; 36:天蓝色; 37:白色
# 字体背景颜色: 40:黑底; 41:红底; 42:绿底; 43:黄底; 44:蓝底; 45:紫底; 46:天蓝底; 47:白底
# 控制选项: \33[0m:关闭所有属性; \33[1m:设置高亮度; \33[4m:下划线; \33[5m:闪烁 



# error log
# @param $1: 消息
function e () {
    message=$1;
    level=4;
    if [ -n "$message" ]; then
	if [ $level -ge $global_constant_log_level ]; then
	    echo -e "\033[41;37m $message \033[0m";
	fi
    fi
}

# debug log
# @param $1: 消息
function d () {
    message=$1;
    level=1;
    if [ -n "$message" ]; then
	if [ $level -ge $global_constant_log_level ]; then
	    echo -e "\033[44;37m $message \033[0m";
	fi
    fi
}

# info log
# @param $1: 消息
function i () {
    message=$1;
    level=2;
    if [ -n "$message" ]; then
	if [ $level -ge $global_constant_log_level ]; then
	    echo -e "\033[42;37m $message \033[0m";
	fi
    fi
}

# warn log
# @param $1:  消息
function w () {
    message=$1;
    level=3;
    if [ -n "$message" ]; then
	if [ $level -ge $global_constant_log_level ]; then
	    echo -e "\033[43;37m $message \033[0m";
	fi
    fi
}

# verbose log
# @param $1: 消息
function v () {
    message=$1;
    level=0;
    if [ -n "$message" ]; then
	if [ @level -ge $global_constant_log_level ]; then
	    echo -e "\033[30;37m $message \033[0m";
	fi
    fi
}

echo "<<<<<<<< include log.sh"
