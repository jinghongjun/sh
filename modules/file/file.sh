#!/bin/bash

# 此文件用于操作文件

if [ "$file" ]; then
    return;
fi

export file="file.sh";

echo ">>>>>>>> inculde file.sh"


# 创建文件并添加新的内容
# @param $1: 创建的文件路径和文件名称
# @param $2: 写入文件的内容
function create_file_and_input_string () {
    file=$1;
    if [ -z "$file" ]; then 
	e "please input file!";
	return 1;
    fi
    if [ ! -f "$file" ]; then
	cat >> $file <<EOF
#!/bin/bash
TARGET_BUILD_ID=1;
TARGET_BUILD_TYPE=DEV;  
EOF
    fi
}


echo "<<<<<<<<< inculde file.sh"
