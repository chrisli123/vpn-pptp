#二 安装相关软件包
#Install_software.sh
#备份/etc/ppp目录下所有文件，后续可能会用
tar ~/-czvf ppp_dir_bak.tar.gz /etc/ppp/* 

yum -y remove pptpd ppp

rm -rf /etc/pptpd.conf
rm -rf /etc/ppp
rm -rf /dev/ppp

cd /etc/ppp
tar -zxvf ppp_dir_bak.tar.gz 

yum -y install make openssl gcc-c++ ppp iptables pptpd iptables-services


