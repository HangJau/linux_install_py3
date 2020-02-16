#########################################################################
# File APP: py3_install.sh
# Author: heng
# Created Time: 2020年02月16日
# Installation only needs to change py_version
#########################################################################
#!/usr/bin/env bash

read -t 5 -p "Enter python version, Please：" py_version
#py_version="3.7.2"
py_in_url="https://www.python.org/ftp/python/${py_version}/Python-${py_version}.tar.xz"


install_yilai(){
	#安装依赖
	yum -y groupinstall "Development tools" &&
	yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel &&
	yum install -y libffi-devel zlib1g-dev &&
	yum install zlib* -y &&
}

install_py(){
	#下载python 并做好编译准备
	wget ${py_in_url} &&
	
	tar -xvJf  Python-${py_version}.tar.xz &&
	mkdir /usr/local/python3 &&
	
	cd Python-${py_version} &&
	./configure --prefix=/usr/local/python3 --enable-optimizations --with-ssl &&

}

set_py(){
	#编译python3并设置以及更新pip
	make && make install &&
	ln -s /usr/local/python3/bin/python3 /usr/local/bin/python3 &&
	ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3 &&

	pip3 install --upgrade pip &&
}

install_yilai
echo "依赖安装完毕..."
sleep 5
install_py
set_py

echo "python3 installed successfully!"
