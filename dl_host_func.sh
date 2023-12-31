
# 下载函数脚本


# 下载 https://github.com/521xueweihan/GitHub520 下的host文件
# https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts

# wget https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts

# 下载核心函数
# 参数为最终目标下载地址
function download_core(){

	# 目标地址
	# 由外部传来
	local tfull_addrs=$1
	
	# echo $tfull_addrs

	echo -e "\e[96m现在开始下载... \n \e[0m"
	echo -e "\e[96m下载地址：\e[94m$tfull_addrs \n \e[0m"
	# 使用wget下载
	wget -O hosts $tfull_addrs

}


# 处理加速地址字符串
# 没有https开头的，就给加上
# 没有/结尾的也给加上
function fix_addrs_str(){
	
	# 原始字符
	local s_str=$1

	# echo -e "\e[96m开始修正地址 $s_str \e[96m...\n \e[0m"
	# echo -e "$s_str \n"

	# 处理
	local prefix_str="https://"
	if [[ "$s_str" =~ ^$prefix_str* ]];then
		s_str=$s_str
	else
		# 把https://添加上
		s_str="https://"$s_str
	fi

	# 判断是否存在 /
	if [[ "$s_str" =~ /$ ]];then
		echo $s_str
	else
		# 加上 / 
		echo $s_str"/"
	fi

}


# 读取地址文件获取可用的加速地址，以此加速下载
# 只读取一行可用的地址
function addrs_reader(){

	# 地址文件名
	local addrs_file=$1

	# 跳过空行及以#开头的行
	# 并读且只读一行
	# t_addrs=$(cat $addrs_file | grep -v ^$ | grep -v ^\# | awk 'NR==1{print}')
	# 判断文件是否存在
	if [[ -e $addrs_file ]];then
		# echo -e "\e[96m开始读取 \e[93m$addrs_file \e[96m文件... \n \e[0m"
		al=$(cat $addrs_file | grep -v ^$ | grep -v ^\# | head -n 1)
	
		echo $al
	else
		echo -e "\e[93m$addrs_file \e[96m文件不存在！ \n \e[0m"
	fi

}


# 使用raw的cdn替换方式加速下载
# 需要传入一个raw的cdn地址字符串参数
function download_replace_prefix(){

	# github 的raw地址前缀
	# raw_prefix_adds='https://raw.githubusercontent.com/'
	# raw_prefix_addrs='https://raw.staticdn.net/'
	local raw_prefix_addrs=$1

	# 处理加速地址字符串
	# 无论这个地址前缀字符串是从读取而来还是直接传参而来
	# 都进行地址字符串处理函数 fix_addrs_str() 处理后才能继续使用
	local raw_prefix_addrs=$(fix_addrs_str $raw_prefix_addrs)
	# raw_prefix_adds=$?
	# echo $raw_prefix_addrs

	# 无前缀的目标地址
	# tfile_noprefix_addrs='521xueweihan/GitHub520/main/hosts'
	local tfile_noprefix_addrs=$2

	# 最终目标地址
	local tcdn_full_addrs=$raw_prefix_addrs$tfile_noprefix_addrs

	# echo $tcdn_full_addrs
	
	# 调用下载核心函数
	download_core $tcdn_full_addrs 

}

# 使用在地址前加代理地下方式加速下载
function download_add_prefix(){

	# 加速代理地址
	local pre_addrs=$1

	# 处理加速地址字符串
	# 无论这个地址前缀字符串是从读取而来还是直接传参而来
	# 都进行地址字符串处理函数 fix_addrs_str() 处理后才能继续使用
	local pre_addrs=$(fix_addrs_str $pre_addrs)

	# 目标完整地址
	local target_full_addrs=$2
	
	# 直接拼接
	local pt_full_addrs=$pre_addrs$target_full_addrs

	# 调用下载核心函数
	download_core $pt_full_addrs

}




# -------------------------------测试执行行区------------------------------- #

# 测试读取文件函数
# r_addrs=./r.txt
# readaddrs $r_addrs

# 测试处理地址字符串
# r_addrs='r.txt'
# addrs_line=$(addrs_reader $r_addrs)
# add_line=`addrs_reader $r_addrs`
# echo $add_line
# fix_addrs_str $addrs_line

# 使用在地址前加代理地下方式加速下载
# addrs_file="a.txt"
# a_str=$(addrs_reader $addrs_file)
# dl_file_addrs="https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts"
# download_add_prefix $a_str $dl_file_addrs 

# 使用cdn替换raw前缀方式加速下载
# 读取地址文件
# addrs_file="r.txt"
# add_str=$(addrs_reader $addrs_file)
# dl_file_addrs="521xueweihan/GitHub520/main/hosts"
# download_replace_prefix $add_str $dl_file_addrs





