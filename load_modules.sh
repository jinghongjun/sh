#!/bin/bash

# 此文件集中加载modules目录脚本

# 全局变量
. global.sh

# svn/git/git-svn代码管理脚本
. code.sh

# gradle构建脚本
. gradle.sh

# mail脚本
. mail.sh

# 终端设置
. terminal.sh

# 日志脚本
. log.sh

# 工具脚本
. tools.sh

# 初始化全局环境变量
clear_global_var;

init_global_var "/codes/taogu/git/BRANCHS/branch_dev_xinxianghos/YHT_Patient";

# 初始化终端样式文件
setting_terminal_style;
