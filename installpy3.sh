#########################################################################
# File APP: py3_install.sh
# Author: heng
# Created Time: 2020年02月16日
# Installation only needs to change py_version
#########################################################################
#!/usr/bin/env bash


py_version="3.8.0"


echo "*************************"
echo "* install: Python ${py_version} * "
echo "*************************"

read -p "Press any key to confirm the installation, Ctrl + C to cancel the operation ....." check_button


py_in_url="https://www.python.org/ftp/python/${py_version}/Python-${py_version}.tar.xz"

#安装依赖
yum -y groupinstall "Development tools" &&
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel &&
yum install -y libffi-devel zlib1g-dev &&
yum install zlib* -y &&


#下载python 并做好编译准备
wget ${py_in_url} &&

tar -xvJf  Python-${py_version}.tar.xz &&
mkdir /usr/local/python3 &&
cd Python-${py_version} &&
./configure --prefix=/usr/local/python3 --enable-optimizations --with-ssl &&


#编译python3并设置以及更新pip
make && make install &&
ln -s /usr/local/python3/bin/python3 /usr/local/bin/python3 &&
ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3 &&

pip3 install --upgrade pip &&


echo "python3 installed successfully!"
