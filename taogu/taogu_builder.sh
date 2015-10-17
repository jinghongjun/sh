#!/bin/bash

# 以下步骤1，2每个自动构建脚本必须引用的
# 1.加载所有构建目录到系统的环境变量PATH
base_dir=$(pwd)
export PATH=$PATH:$base_dir/sh:$base_dir/sh/modules/global:$base_dir/sh/modules/code:$base_dir/sh/modules/gradle:$base_dir/sh/modules/mail:$base_dir/sh/modules/terminal:$base_dir/sh/modules/log:$base_dir/sh/modules/tools:$base_dir/sh/taogu

# 2.加载所需要的shell脚本
. load_modules.sh
. taogu/global_taogu.sh
. taogu_tools.sh

build_taogu_apk;

