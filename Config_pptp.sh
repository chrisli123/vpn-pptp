#三 配置PPTP
#
#1 配置PPTP认证信息
#将VPN用户、密码、来源IP端（*通配所有）添加到/chap-secrets文件中
# /etc/ppp/chap-secrets
#
echo "vpn_user pptpd vpnuserpass *" >> /etc/ppp/chap-secrets

#2 配置PPTP协议监听IP
#/etc/pptpd.conf
#
echo "localip 10.0.0.1" >>/etc/pptpd.conf

#配置拨号后分配给VPN用户的IP地址
#(A.地址可以使用内网现有地址段，需要有内网各网段三层互通，此方式的源地址不会改变）
#(B.地址可以使用任意地址段，此方式源地址会修改为监听地址，即NAT方式，
#   同时需要在iptables的NAT表中添加NAT POSTROUTING规则。)
#
echo "remoteip 10.0.1.2-101" >> /etc/pptpd.conf

#3 配置分配给VPN用户的DNS服务器地址
#/etc/ppp/options.pptpd
#
echo "ms-dns 10.0.0.10" >> /etc/ppp/options.pptpd
echo "ms-dns 10.0.0.11" >>/etc/ppp/options.pptpd

#4 配置内核使IP转发生效
# /etc/sysctl.conf
#
echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf
sysctl -p 

#5 创建面向字符的特殊文件的索引节点，类似于PPP0,PPP1,PPP2
#
mknod /dev/ppp c 108 0 
 
