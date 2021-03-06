#!/bin/bash

# 此文件主要用于桃谷编译的工具

if [ "$taogu_tools" ]; then
    return;
fi

export taogu_tools="taogu_tools.sh";

. log.sh

echo ">>>>>>>> include taogu_tools.sh"

function build_taogu_apk () {
	goto_build_target;
}

function goto_build_target () {
	echo -e "请选择你要编译的Androd版本:\n\n\t(1)桃谷医院专家开发版\n\t(2)桃谷医院专家正式版\n\t(3)新乡中心医院开发版\n\t(4)新乡中心医院正式版\n\t(5)商丘市一院开发版\n\t(6)商丘市一院正式版\n\t(7)桃谷医院开发版\n\t(8)桃谷医院测试版\n\t(9)唐山人民医院开发版\n\t(10)唐山人民医院正式版\n\t(11)开封市二院开发版\n\t(12)开封市二院正式版\n\t(13)博爱妇幼保健院开发版\n\t(14)博爱妇幼保健院正式版\n\t(15)安阳市中医院开发版\n\t(16)安阳市中医院正式版\n\t(17)南阳市二院开发版\n\t(18)南阳市二元正式版\n\t(19)平顶山市一院开发版\n\t(20)平顶山市医院正式版\n\t(21)驻马店市医院开发版\n\t(22)驻马店市医院正式版\n\t(0)退出"
	read TAOGU_BUILD_TARGET;
	if [ "$TAOGU_BUILD_TARGET" -gt 0 ] 2>/dev/null ;then

	    if [ $TAOGU_BUILD_TARGET -gt $ZHUMADIAN_REL ]; then
		w "请输入菜单指示项数字！";
		exit 0;
	    fi
	    
	    case $TAOGU_BUILD_TARGET in
		0)
		    i "退出"
	            exit 0;;
		1)
		    i "开始编译桃谷医院专家开发版";;
		2)
                    i "开始编译桃谷医院专家正式版";; 
		3)
		    i "新乡中心医院开发版";;
		4)
	            i "新乡中心医院正式版";;
		5)
		    i "商丘市一院开发版";;
		6)
		    i "商丘市一院正式版";;
		7)
		    i "桃谷医院开发版";;
		8)
		    i "桃谷医院测试版";;
		9)
		    i "唐山人民医院开发版";;
		10)
	            i "唐山人民医院正式版";;
		11)
		    i "开封市二院开发版";;
		12)
		    i "开封市二院正式版";;
		13)
		    i "博爱妇幼保健院开发版";;
		14)
                    i "博爱妇幼保健院正式版";;
		15)
		    i "安阳市中医院开发版";;
		16)
                    i "安阳市中医院正式版";;
		17)
		    i "南阳市二院开发版";;
		18)
	            i "南阳市二元正式版";;
		19)
		    i "平顶山市一院开发版";;
		20)
		    i "平顶山市医院正式版";;
		21)
		    i "驻马店市医院开发版";;
		22)
	            i "驻马店市医院正式版";;
      	    esac

	else
	    e "字母输入无效，请输入菜单项数字！";
	    exit 0;
	fi
	    
}


echo "<<<<<<<< include taogu_tools.sh"
