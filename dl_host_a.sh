
# 直接添加地址「前缀」的方式，使用加速地址加速下载

# ----------------------------引入脚本---------------------------- #
# 下载脚本
source ./dl_host_func.sh

# ----------------------------执行---------------------------- #

# 加速地址列表文件
a_file='a.txt'

# 目标完整地址
tf_addrs='https://raw.githubusercontent.com/521xueweihan/GitHub520/main/hosts'

# 下载函数
function dl_a(){

	# 读取加速文件获取加速地址
	local a_str=$(addrs_reader $a_file)
	
	# 下载
	download_add_prefix $a_str $tf_addrs
}


# -----------------------执行----------------------- #

dl_a


