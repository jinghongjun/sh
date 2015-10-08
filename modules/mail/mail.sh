#!/bin/bash

# 此文件主要用于邮件工具

if [ "$mail" ]; then
    return;
fi

export mail="mail.sh";

. log.sh

echo ">>>>>>>> include mail.sh"


# 安装mutt和msmtp
# sudo apt-get install mutt
# sudo apt-get insall msmtp

# 配置文件

# .muttrc
# set sendmail="/usr/bin/msmtp"
# set use_from=yes
# set realname="xxxxx@xxxxx.com"
# set from="xxxxxx@xxxxxx.com"
# set envelope_from=yes
# set editor="emacs -nw"

# .msmtprc
# account default
# host smtp.qiye.163.com
# port 25
# from xxxxx@xxxx.com
# auth plain
# user xxxxxx@xxxxx.com
# password xxxxxxx
# logfile ~/.msmtp.log

# 发送错误通知邮件,请标准格式传递参数，否则邮件发送失败
# @param $1: 邮件标题
# @param $2: 邮件内容
# @param $3: 邮件接收人
# @param $4: 邮件抄送人
# @param $5: 邮件附件
function send_mail () {
    # 邮件发送命令
    command=""
    # $1:邮件标题
    title=$1;
    # $2:邮件内容
    content=$2;
    # $3:邮件接收人
    recipient=$3;
    # $4:邮件抄送人
    cc=$4;
    # $5:邮件附件
    attachment=$5;
    echo title is $title, content is $content, recipient is $recipient, cc is $cc, attachment is $attachment;
    if [ -n "$recipient" ]; then
	echo send mail success,please check your email.
	if [ -n "$content" ]; then
	   part_1="echo $content | ";
	fi
	if [ -n "$title" ]; then
	    part_2="mutt -s $title ";
	fi
	if [ -n "$recipient" ]; then
	    part_3=" $recipient ";
	fi
	if [ -n "$cc" ]; then
	    part_4=" -c $cc ";
	fi
	if [ -n "$attachment" ]; then
	    part_5=" -a $attachment ";
	fi
	command=${part_1}${part_2}${part_3}${part_4}${part_5}
	echo command: $command
	eval $command
    else
	echo send mail failure,because the recipient did not fill out.
    fi
}

echo "<<<<<<<< include mail.sh"
