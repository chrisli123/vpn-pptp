#二 安装相关软件包
#Install_software.sh

yum -y remove pptpd ppp

rm -rf /etc/pptpd.conf
rm -rf /etc/ppp
rm -rf /dev/ppp


yum -y install make openssl gcc-c++ ppp iptables pptpd iptables-services
