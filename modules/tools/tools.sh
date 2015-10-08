#!/bin/bash

# 此文件主要集成常用的工具

if [ "$tools" ]; then
    return;
fi

export tools="tools.sh";

. log.sh

echo ">>>>>>>> include tools.sh"

# 搜索字符串首次匹配的行号
# @param $1: 查找的字符
# @param $2: 查找的文件
# @param $3: 匹配的次数;如不指定，则返回首次匹配的位置
# @return: 匹配的行数;如果没有找到,则返回－1;
function get_line_number_for_search_string () {
    search_string=$1;
    if [ -z "@search_string" ]; then
	e "please input search string";
	return;
    fi
    search_file=$2;
    if [ -z "@search_file" ]; then
	e "please input search file";
	return;
    fi
    matching_number=$3;
    if [ -z "$matching_number" ]; then
	e "please input matching number";
	return;
    fi
    i "search_string: $search_string, search_file: $search_file, matching_number: $matching_number";
    match=`grep -n "$search_string" $search_file | head $matching_number | cut -d ":" -f 1`;
    return $match;

}

# 搜索字符串最后匹配的行号
# @param $1: 查找的字符
# @param $2: 查找的文件
# @param $3: 匹配次数;如不指定，则返回最后匹配的位置
# @return: 匹配的行数;如果没有找到,则返回-1;
function get_line_number_reverse_for_search_string () {
    search_string=$1;
    if [ -z "@search_string" ]; then
	e "please input search string";
	return;
    fi
    search_file=$2;
    if [ -z "@search_file" ]; then
	e "please input search file";
	return;
    fi
    matching_number=$3;
    if [ -z "@matching_number" ]; then
	e "please input matching number";
	return;
    fi
    
    i "search_string: $search_string, search_file: $search_file, matching_number: $matching_number"
    match=`grep -n "$search_string" $search_file | tail $matching_number | cut -d ":" -f 1`;
    return $match;
}

# 在文件指定行数之前添加指定内容
# @param $1: 插入内容
# @param $2: 插入文件
# @param $3: 行号
function insert_content_in_file_by_line_number_before () {
    insert_content=$1;
    insert_file=$2;
    line_number=$3;
    i "insert_content: $insert_content, insert_file: $insert_file, line_number: $line_number";
    if [ -z "$insert_content" ]; then
	e "please input insert content";
	return;
    fi
    if [ -z "$insert_file" ]; then
	e "please input insert file";
	return;
    fi
    if [ -z "$line_number" ]; then
	e "please input line number";
	return;
    fi
    eval "sed -i '${line_number}i ${insert_content}'  $insert_file";
}


# 在文件指定行数之后添加指定内容
# @param $1: 插入内容
# @param $2: 插入文件
# @param $3: 行号
function insert_content_in_file_by_line_number_after () {
    insert_content=$1;
    insert_file=$2;
    line_number=$3;
    i "insert_content: $insert_content, insert_file: $insert_file, line_number: $line_number";
    if [ -z "$insert_content" ]; then
        e "please input insert content";
        return;
    fi
    if [ -z "$insert_file" ]; then
        e "please input insert file";
        return;
    fi
    if [ -z "$line_number" ]; then
        e "please input line number";
    fi
    eval "sed -i '${line_number}a ${insert_content}' $insert_file";
}

# 更新文件指定内容
# @param $1: 查找内容 
# @param $2: 更新内容
# @param $3: 查找文件
function update_content_in_file_by_specify_string () {
    search_string=$1;
    if [ -z "@search_string" ]; then
	e "please input search string";
	return;
    fi
    update_string=$2;
    if [ -z "$update_string" ]; then
	e "please input update string";
	return;
    fi
    search_file=$3;
    if [ -z "$search_file" ]; then
	e "please input search file";
	return;
    fi
    eval "sed -i -e 's,${search_string},${update_string},g' ${search_file} ";

    
}

# 查找文件:默认只取第一个查找到的文件，并把结果赋给全局变量global_var_find_file;
# @param $1: 查找目录
# @param $2: 查找文件名称
function find_file () {
    find_folder=$1;
    find_file=$2;
    if [ -z "$find_folder" ]; then
	e "please input find folder";
	return;
    fi
    if [ -z "$find_file" ]; then
	e "please input find file";
	return;
    fi
    global_var_find_file="";
    for file in `find $find_folder -name $find_file`
    do
	global_var_find_file=$file;
	break;
    done
}

# 获取应用程序版本名称
# @param $1: 查找文件
# @param $2: 查找关键字
function get_app_version_name () {
    search_file=$1;
    search_key=$2;
    if [ -z "$search_file" ]; then
	e "please input search file";
	return;
    fi
    if [ -z "$search_key" ]; then
	e "please input search key";
	return;
    fi
    i "search_file: $search_file, search_key: $search_key";
    global_var_main_app_version_name=`grep -n "$search_key" $search_file | cut -f2 -d \"`;
}

# 获取应用程序版本号码
# @param $1: 查找文件
# @param $2: 查找关键字
function get_app_version_code () {
    search_file=$1;
    search_key=$2;
    if [ -z "$search_file" ]; then
	e "please input search file";
	return;
    fi
    if [ -z "$search_key" ]; then
	e "please input search key";
	return;
    fi
    i "search_file: $search_file, search_key: $search_key";
    global_var_main_app_version_code=`grep -n "$search_key" $search_file | awk '{print $3}'`;	
}

echo "<<<<<<<< include tools.sh"
