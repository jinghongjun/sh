#!/bin/bash

# 以下步骤1，2每个自动构建脚本必须引用的
# 1.加载所有构建目录到系统的环境变量PATH
base_dir=$(pwd)
export PATH=$PATH:$base_dir/sh:$base_dir/sh/modules/global:$base_dir/sh/modules/code:$base_dir/sh/modules/gradle:$base_dir/sh/modules/mail:$base_dir/sh/modules/terminal:$base_dir/sh/modules/log:$base_dir/sh/modules/tools:$base_dir/sh/taogu:$base_dir/sh/modules/file

# 2.加载所需要的shell脚本
. load_modules.sh
. global_taogu.sh
. taogu_tools.sh

# 加载桃谷编译系统配置文件
taogu_build_config="${PWD}/sh/taogu/taogu.config";
create_file_and_input_string $taogu_build_config;
if  [ -f "$taogu_build_config" ]; then
    . $taogu_build_config;
fi
echo result: $?;
echo TARGET_BUILD_ID: $TARGET_BUILD_ID, TARGET_BUILD_TYPE: $TARGET_BUILD_TYPE; 


#build_taogu_apk;

