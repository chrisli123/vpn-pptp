#四 配置iptables
#
#1 关闭CENTOS7系统默认防火墙，而使用iptables
#
systemctl stop firewalld.service
systemctl disable firewalld.service

#2 清空，刷新iptables
#
iptables -F
iptables -X
iptables -Z

#3 配置相关filter表的规则
#
#允许SSH协议入站
#
iptables -A INPUT -p tcp -s 10.255.3.0/24 --dport 22 -j ACCEPT
#允许PPTP协议入站
#
iptables -A INPUT -p tcp --dport 1723 -j ACCEPT

#允许已建立的连接和相关连接状态数据包通过入站
#
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#允许GRE协议入站
#
iptables -A INPUT -p gre -j ACCEPT

#允许GRE协议出站
#
iptables -A OUTPUT  -p gre -j ACCEPT

#拒绝其他未明确规则入站
#
iptables -A INPUT -j REJECT

#设置转发表的TCP MTU为1356
#
iptables -A FORWARD -p tcp --syn -j TCPMSS --set-mss 1356

#启用NAT，来源地址端NAT为网卡接口应IP地址转发出去（出接口网卡名称ens160可能不一样）
#如果分配给用户的内网地址三层互通，可以不用配置此项

#iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o ens160 -j MASQUERADE

/usr/libexec/iptables/iptables.init save

#
#安装完毕
#
echo "The VPN-PPTP service install successful"

echo "运行PPTP服务"
systemctl enable pptpd.service

systemctl start pptpd.service

systemctl enable iptables.service

systemctl restart iptables.service

echo "pptp service is running!"
