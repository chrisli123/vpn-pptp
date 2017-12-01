基于pptp协议的VPN服务搭建
====
一 系统环境
-------
    CPU： 1*2.4GHz
    内存：512MB
    硬盘：20GB(SAS)
    网卡：1*1Gbps
    OS：CentOS 7_64bit(1708)
    最小化安装
-----
二 安装步骤
----
    1 添加有PPTP软件的YUM ，此处采用EPEL；
    2 下载安装PPTP、iptables及相关软件包；
    3 配置PPTP、PPP；
    4 配置IPtables
    5 安装完毕，启动服务。
