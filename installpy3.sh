#########################################################################
# File APP: py3_install.sh
# Author: heng
# Created Time: 2020年02月16日
#########################################################################
#!/usr/bin/env bash

py_version = "3.7.2/Python-3.7.2.tar.xz"
py_in_url = "https://www.python.org/ftp/python/"


install_yilai(){
	#安装依赖
	yum -y groupinstall "Development tools" &&
	yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel &&
	yum install -y libffi-devel zlib1g-dev &&
	yum install zlib* -y &&
}

install_yilai
echo "依赖安装完毕..."

wget https://www.python.org/ftp/python/py_version &&
sleep 5

tar -xvJf  Python-3.7.2.tar.xz &&
mkdir /usr/local/python3 &&
cd Python-3.7.2 &&
./configure --prefix=/usr/local/python3 --enable-optimizations --with-ssl &&
#第一个指定安装的路径,不指定的话,安装过程中可能软件所需要的文件复制到其他不同目录,删除软件很不方便,复制软件也不方便.
#第二个可以提高python10%-20%代码运行速度.
#第三个是为了安装pip需要用到ssl,后面报错会有提到.
make && make install &&
ln -s /usr/local/python3/bin/python3 /usr/local/bin/python3 &&
ln -s /usr/local/python3/bin/pip3 /usr/local/bin/pip3 &&

pip3 install --upgrade pip &&

echo "python3 installed successfullly!"
