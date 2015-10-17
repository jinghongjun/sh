#!/bin/bash

# 此文件主要用于桃谷编译的工具

if [ "$taogu_tools" ]; then
    return;
fi

export taogu_tools="taogu_tools.sh";

. log.sh

echo ">>>>>>>> include taogu_tools.sh"

function build_taogu_apk () {
	diplay_build_options;
	goto_build_options;
}

function diplay_build_options () {
	echo -e "请选择你要编译的Androd版本:\n\n\t(0)桃谷医院专家开发版\n\t(1)桃谷医院专家正式版\n\t(2)新乡中心医院开发版\n\t(3)新乡中心医院正式版\n\t(4)商丘市一院开发版\n\t(5)商丘市一院正式版\n\t(6)桃谷医院开发版\n\t(7)桃谷医院测试版\n\t(8)唐山人民医院开发版\n\t(9)唐山人民医院正式版\n\t(10)开封市二院开发版\n\t(11)开封市二院正式版\n\t(12)博爱妇幼保健院开发版\n\t(13)博爱妇幼保健院正式版\n\t(14)安阳市中医院开发版\n\t(15)安阳市中医院正式版\n\t(16)南阳市二院开发版\n\t(17)南阳市二元正式版\n\t(18)平顶山市一院开发版\n\t(19)平顶山市医院正式版\n\t(20)驻马店市医院开发版\n\t(21)驻马店市医院正式版\n"
	read TAOGU_BUILD_TARGET;
	echo $TAOGU_BUILD_TARGET;
}

function goto_build_options () {
	echo "TAOGU_BUILD_TARGET: $TAOGU_BUILD_TARGET"
	if [ $TAOGU_BUILD_TARGET -eq $TAOGU_ZHUANJIA_DEV ]; then
		i "开始编译桃谷医院专家开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$TAOGU_ZHUANJIA_REL" ]; then
		i "开始编译桃谷医院专家正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$XINXIANG_DEV" ]; then
		i "开始编译新乡中心医院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$XINXIANG_REL" ]; then
		i "开始编译新乡中心医院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$SHANGQIU_DEV" ]; then
		i "开始编译商丘市一院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$SHANGQIU_REL" ]; then
		i "开始编译商丘市一院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$TAOGU_DEV" ]; then
		i "开始编译桃谷医院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$TAOGU_REL" ]; then
		i "开始编译桃谷医院测试版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$TANGSHAN_DEV" ]; then
		i "开始编译唐山人民医院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$TANGSHAN_REL" ]; then
		i "开始编译唐山人民医院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$KAIFENG_DEV" ]; then
		i "开始编译开封市二院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$KAIFENG_REL" ]; then
		i "开始编译开封市二院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$BOAI_DEV" ]; then
		i "开始编译博爱妇幼保健院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$BOAI_REL" ]; then
		i "开始编译博爱妇幼保健院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$ANYANG_DEV" ]; then
		i "开始编译安阳市中医院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$ANYANG_REL" ]; then
		i "开始编译安阳市中医院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$NANYANG_DEV" ]; then
		i "开始编译南阳市二院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$NANYANG_REL" ]; then
		i "开始编译南阳市二元正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$PINGDINGSHAN_DEV" ]; then
		i "开始编译平顶山市一院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$PINGDINGSHAN_REL" ]; then
		i "开始编译平顶山市医院正式版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$ZHUMADIAN_DEV" ]; then
		i "开始编译驻马店市医院开发版";
	elif [ "$TAOGU_BUILD_TARGET" -eq "$ZHUMADIAN_REL" ]; then
		i "开始编译驻马店市医院正式版";
	else
		i "退出桃谷Android编译系统";
		exit 0;
	fi
}


echo "<<<<<<<< include taogu_tools.sh"
