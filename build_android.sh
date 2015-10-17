#!/bin/bash

# 以下步骤1，2每个自动构建脚本必须引用的
# 1.加载所有构建目录到系统的环境变量PATH
base_dir=$(pwd)
export PATH=$PATH:$base_dir/sh:$base_dir/sh/modules/global:$base_dir/sh/modules/code:$base_dir/sh/modules/gradle:$base_dir/sh/modules/mail:$base_dir/sh/modules/terminal:$base_dir/sh/modules/log:$base_dir/sh/modules/tools

# 2.加载所需要的shell脚本
. load_modules.sh

#测试check_code_management_tool
#check_code_management_tool;
#echo $?

#测试同步代码
#sync_code;

#测试发送邮件
#title="错误xtz";
#content="资源缺失";
#recipient="jinghongjun@91taogu.com";
#cc="nothingoneday@163.com,hongjun.jing@gmail.com";
#attachment="~/Desktop/sendmail.sh"
#send_mail $title $content $recipient $cc $attachment;

#测试调试工具
#e "debug type is e";
#d "debug type is d";
#i "debug type is i";
#w "debug type is w";

#测试获取APP的版本名称
#get_build_gradle_path "/codes/taogu/svn/branchs/branch_dev_xinxianghos/YHT_Patient";

#测试查找字符串在文件中的位置
#get_line_number_for_search_string "defaultConfig"  $global_var_main_app_build_gradleo "-1";
#echo result: $?;

#get_line_number_reverse_for_search_string "defaultConfig" $global_var_main_app_build_gradle "-1";
#echo result: $?

#add_signing_configs;

# 测试在指定行号之前或之后添加指定内容
#insert_content_in_file_by_line_number_before;
#insert_content_in_file_by_line_number_after "456645" $global_var_main_app_build_gradle "54"

# 测试更新SystemFuction.java更新开发环境
#update_content_in_file_by_specify_string "private static boolean DEVELOPING_ENV = true;" "private static boolean DEVELOPING_ENV = false;" $global_var_system_function;

# 测试查找版本名称
#get_app_version_name $global_var_main_app_build_gradle "versionName";
#echo app_version_name: $global_var_main_app_version_name;

# 测试查找版本号码
#get_app_version_code $global_var_main_app_build_gradle "versionCode";
#echo app_version_code: $global_var_main_app_version_code;

#版本号升级并提交到代码库
#increased_version_number_and_commit;

#taogu_expect_action;
build_taogu_apk;
