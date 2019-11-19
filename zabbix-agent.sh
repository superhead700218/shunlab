#!/bin/bash
rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
yum -y install zabbix-agent
systemctl restart zabbix-agent
systemctl enable zabbix-agent
