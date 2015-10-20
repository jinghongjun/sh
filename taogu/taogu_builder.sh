#!/bin/bash

# 以下步骤1，2每个自动构建脚本必须引用的
# 1.加载所有构建目录到系统的环境变量PATH
base_dir=$(pwd)
export PATH=$PATH:$base_dir/sh:$base_dir/sh/modules/global:$base_dir/sh/modules/code:$base_dir/sh/modules/gradle:$base_dir/sh/modules/mail:$base_dir/sh/modules/terminal:$base_dir/sh/modules/log:$base_dir/sh/modules/tools:$base_dir/sh/taogu:$base_dir/sh/modules/file

# 2.加载所需要的shell脚本
. load_modules.sh
. global_taogu.sh
. taogu_tools.sh

# 初始化全局环境变量
clear_global_var;

# 加载桃谷编译系统配置文件
taogu_build_config="${PWD}/sh/taogu/taogu.config";
if [ ! -f "$taogu_build_config" ]; then
cat >> $taogu_build_config <<EOF
#!/bin/bash
# 主应用目录路径
TARGET_BUILD_MAIN_APP="";
# 配置桃谷build目标版本
TARGET_BUILD_ID="";
# APK_NAME="";
# 是否追加版本号
INCREASED_VERSION_NUMBER=YES;
# 是否把APK上传到服务器
UPLOAD_BUILD_APK=YES;
# 是否改变Index.html文件
UPDATE_INDEX_CONFIG=YES;
# 是否发送邮件通知
SEND_EMAIL_NOTIFICATION=YES;
# 邮件抄送人
MAIL_CC="";
# 邮件标题
MAIL_TITLE="";
# 邮件内容
MAIL_CONTENT="";
EOF
fi

. $taogu_build_config;

echo taogu_build_config is $taogu_build_config;

if [ "$TARGET_BUILD_ID" -gt 0  ] 2>/dev/null; then
    if [ $TARGET_BUILD_ID -gt $ZHUMADIAN_REL ]; then
	e "编译系统目前不支持这个版本编译！";
	exit 0;
    fi
    if [ $TARGET_BUILD_ID -eq $EXIT ]; then
	e "请查看$taogu_build_config中的TARGET_BUILD_ID";
    fi
else
    e "TARGET_BUILD_ID设置成字母无效，请重新设置成数字";
    exit 0;
fi

# 区分开发版和正式版
if [ -n "$TARGET_BUILD_ID" ]; then
    number=`expr $TARGET_BUILD_ID % 2`;
    if [ $number = "0" ]; then
	TARGET_BUILD_TYPE=$TARGET_BUILD_TYPE_REL;
    else
	TARGET_BUILD_TYPE=$TARGET_BUILD_TYPE_DEV;
    fi
else
    e "please input TARGET_BUILD_ID in $taogu_build_config";
    exit 0;
fi

# 初始化不同医院编译配置
case $TARGET_BUILD_ID in
	1)
		i "桃谷医院专家开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Tagoguzhuanjia;;
	2)
		i "桃谷医院专家正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Tagoguzhuanjia;;
	3)
		i "新乡中心医院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Xinxiang;;
	4)
		i "新乡中心医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Xinxiang;;
	5)
		i "商丘市一院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Shangqiu;;
	6)
		i "商丘市一院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Shangqiu;;
	7)
		i "桃谷医院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Taoguyiyuan;;
	8)
		i "桃谷医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Taoguyiyuan;;
	9)
		i "唐山人民医院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Tangshan;;
	10)
		i "唐山人民医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Tangshan;;
	11)
		i "开封市二院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Kaifeng;;
	12)
		i "开封市二院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Kaifeng;;
	13)
		i "博爱妇幼保健院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Boai;;
	14)
		i "博爱妇幼保健院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Boai;;
	15)
		i "安阳市中医院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Anyang;;
	16)
		i "安阳市中医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Anyang;;
	17)
		i "南阳市二院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Nanyang;;
	18)
		i "南阳市二院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Nanyang;;
		
	19)
		i "平顶山市一院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Pingdingshan;;
	20)
		i "平顶山市医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Pingdingshan;;
	21)
		i "驻马店市医院开发版";
		APK_NAME=${TARGET_BUILD_TYPE_DEV}_Zhumadian;;
	22)
		i "驻马店市医院正式版";
		APK_NAME=${TARGET_BUILD_TYPE_REL}_Zhumadian;;
esac

if [ -z "$TARGET_BUILD_MAIN_APP" ]; then
	e "please input TARGET_BUILD_MAIN_APP";
	exit 0;
fi    

i "--------- taogu.config ------------";
i "TARGET_BUILD_ID: $TARGET_BUILD_ID";
i "TARGET_BUILD_MAIN_APP: $TARGET_BUILD_MAIN_APP";

i "------------------------------------"

init_global_var $TARGET_BUILD_MAIN_APP;

#build_taogu_apk;

