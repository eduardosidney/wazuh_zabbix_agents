#!/bin/env bash

################################################
# download zabbix agent version 6 for CentOs 7 #
################################################
rpm -Uvh https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-6.0-2.el7.noarch.rpm

################################################
#                     Install                  #
################################################

yum install zabbix-agent -y

################################################
#           Restart and enable                 #
################################################

systemctl restart zabbix-agent
systemctl enable zabbix-agent

################################################
#   replaces 127.0.0.1 for zabbix server ip    #
################################################


sed -i '117 s/'Server=127.0.0.1'/'Server=168.138.134.255'/' /etc/zabbix/zabbix_agentd.conf
sed -i '170 s/'ServerActive='/'ServerActive=168.138.134.255'/' /etc/zabbix/zabbix_agentd.conf
sed -i '181 s/'Zabbix server'/'TSAGLBSRV030'/' /etc/zabbix/zabbix_agentd.conf

################################################
#           Restart and start                  #
################################################

systemctl restart zabbix-agent
systemctl start zabbix-agent
