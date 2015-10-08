#!/bin/bash

# 此文件用于设置终端样式

if [ "$terminal" ]; then
    return;
fi

export terminal="terminal.sh";

. log.sh

echo ">>>>>>>> include terminal.sh"

# 终端标题样式
function setting_terminal_style () {
    # FIXME mac没有效果
    PROMPT_COMMAND="echo -ne \"\033]0; taogu shell env \007\""
}

echo "<<<<<<<< include terminal.sh"
