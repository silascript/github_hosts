
# 以替换raw地址「前缀」的方式，使用加速地址加速下载

# ----------------------------引入脚本---------------------------- #
# 下载脚本
source ./dl_host_func.sh

# ----------------------------执行---------------------------- #

# 加速地址列表文件
r_file='./r.txt'

# 目录地址
tf_addrs='521xueweihan/GitHub520/main/hosts'

# 下载
function dl_r(){

	# 读取加速文件获取加速地址
	readaddrs $r_file
	r_addrs=$0
	
	# 下载
	download_replace_prefix $r_addrs $tf_addrs
}



# -----------------------测试----------------------- #

dl_r


