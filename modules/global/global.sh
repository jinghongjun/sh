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
global_var_find_file="";

echo "<<<<<<<< include global.sh"
