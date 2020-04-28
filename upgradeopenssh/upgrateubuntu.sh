#!/bin/bash
apt-get   install   telnetd  xinetd
apt  install   libzip-dev  libssl-dev autoconf  gcc  libxml2   make
#cd /usr/local/src
#wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.9p1.tar.gz
#wget https://www.openssl.org/source/openssl-1.1.1.tar.gz --no-check-certificate
#wget http://www.zlib.net/zlib-1.2.11.tar.gz
tar -zxvf openssh-7.9p1.tar.gz
tar -zxvf openssl-1.1.1.tar.gz
tar -zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=/usr/local
make
make install
apt purge openssl
cd ../openssl-1.1.1
./config shared --prefix=/usr/local/ssl
make test
make install
ln -s /usr/local/ssl/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1
ln -s /usr/local/ssl/lib/libcrypto.so.1.1 /usr/lib/libcrypto.so.1.1
service sshd stop
apt purge ssh
cd ../openssh-7.9p1
./configure --prefix=/usr/local --sysconfdir=/etc/ssh --with-ssl-dir=/usr/local/ssl
make 
make install
mv /usr/bin/scp /tmp/;mv /usr/bin/ssh* /tmp/
ln -s /usr/local/bin/ssh /usr/bin/ssh
ln -s /usr/local/bin/scp /usr/bin/scp
ln -s /usr/local/bin/ssh-add /usr/bin/ssh-add
ln -s /usr/local/bin/ssh-agent /usr/bin/ssh-agent
ln -s /usr/local/bin/ssh-keygen  /usr/bin/ssh-keygen
ln -s /usr/local/bin/ssh-keyscan /usr/bin/ssh-keyscan
ln -s /usr/local/bin/openssl /usr/bin/openssl
ln -s /usr/local/sbin/sshd /usr/bin/sshd
service sshd  restart
ssh  -V
sshd -V
openssl version -a
