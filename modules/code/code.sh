#!/bin/bash

# 此文件主要用于代码版本控制的工具

if [ "$code" ]; then
    return;
fi

export code="code.sh";

. log.sh
. tools.sh

echo ">>>>>>>> include code.sh"

# 检查当前代码版本控制工具
# return: 100:svn; 200:git svn; -1:没有
function check_code_management_tool () {
    if [ -d ".svn" ]; then
	# svn
	echo 100;
    elif [ -d ".git" ]; then
	# git/git-svn
	echo 200;
    else
	echo 300;
    fi
}

# 移除变动代码并同步最新的代码
function sync_code () {
    result=`check_code_management_tool`;
    if [ $result -eq 100 ]; then
	svn_sync_code;
    elif [ $result -eq 200 ]; then
	git_svn_sync_code;
    else
	echo "none >>> code";
    fi
}

# git svn 同步代码
function git_svn_sync_code () {
    # TODO 保存已经修改的文件
    git reset --hard;
    git svn fetch;
    git svn rebase;
}

# svn 同步代码
function svn_sync_code () {
    # TODO 保存已经修改的文件
    svn revert --recursive .;
    svn update;
}

function svn_commit_version_code () {
    # 增加build.gradle到代码库
    svn add $global_var_main_app_build_gradle;
    # 增加AndroidManifest.xml到代码库
    svn add $global_var_main_app_android_manifest;
    # 获取增加版本号
    get_app_version_code $global_var_main_app_build_gradle "versionCode";
    eval 'svn commit -m "${global_constant_current_user_name}: Change version number to ${global_var_main_app_version_code}"';
    svn revert --recursive .;
    svn update;
}

function git_svn_commit_version_code () {
    # 增加build.gradle到代码库
    git add $global_var_main_app_build_gradle;
    # 增加AndroidManifest.xml到代码库
    git add $global_var_main_app_android_manifest;
    # 获取增加版本号
    get_app_version_code $global_var_main_app_build_gradle "versionCode";
    eval 'git commit -m "${global_constant_current_user_name}: Change version number to ${global_var_main_app_version_code}"';
    git reset --hard;
    git svn fetch;
    git svn rebase;
    git svn dcommit;
}

function commit_version_code () {
    result=`check_code_management_tool`;
    if [ $result -eq 100 ]; then
	svn_commit_version_code;
    elif [ $result -eq 200 ]; then
	git_svn_commit_version_code;
    else
	echo "none >>> code";
    fi
}

# 应用版本号升级
function increased_version_number_and_commit () {
    # 同步代码
    sync_code;
    # 获取当前版本号码
    get_app_version_code $global_var_main_app_build_gradle "versionCode";
    i "current version code: $global_var_main_app_version_code";
    # 获取需要增加版本号码
    change_version_code=$[global_var_main_app_version_code+1];
    i "chang version code: $change_version_code";
    # 更新build.gradle
    update_content_in_file_by_specify_string $global_var_main_app_version_code $change_version_code  $global_var_main_app_build_gradle ;
    # 更新AndroidManifest.xml
    update_content_in_file_by_specify_string $global_var_main_app_version_code $change_version_code $global_var_main_app_android_manifest;
    commit_version_code;
}

echo "<<<<<<<< include code.sh"
