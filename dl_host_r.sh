
# 以替换raw地址「前缀」的方式，使用加速地址加速下载

# ----------------------------引入脚本---------------------------- #
# 下载脚本
source ./dl_host_func.sh

# ----------------------------执行---------------------------- #

# 加速地址列表文件
r_file='r.txt'

# 目录地址
tf_addrs='521xueweihan/GitHub520/main/hosts'

# 下载
function dl_r(){

	# 读取加速文件获取加速地址
	r_str=$(addrs_reader $r_file)
	
	# 下载
	download_replace_prefix $r_str $tf_addrs
}


# -----------------------执行----------------------- #

dl_r


