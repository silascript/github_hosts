
# 下载 https://github.com/521xueweihan/GitHub520 下的host文件
# https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts

# 下载函数
function download(){

	# wget https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts
	# 使用meoyy.cn/gh-proxy/ 加速下载
	# https://github.moeyy.xyz/https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts 
	tfile_adds='https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts'
	proxy_adds='https://github.moeyy.xyz/'

	full_adds=$proxy_adds$tfile_adds

	echo -e "\e[96m 现在开始下载... \e[0m"
	wget -O hosts $full_adds


}


# -------------------------------执行区------------------------------- #

download



