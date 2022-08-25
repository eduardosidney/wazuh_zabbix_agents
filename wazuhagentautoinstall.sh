#!/bin/env bash

#Import the GPG key:

rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH


#Add the repository:

cat > /etc/yum.repos.d/wazuh.repo << EOF
[wazuh]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=EL-\$releasever - Wazuh
baseurl=https://packages.wazuh.com/4.x/yum/
protect=1
EOF



#Deploy a Wazuh agent

WAZUH_MANAGER="10.0.0.2"

yum install wazuh-agent -y



systemctl daemon-reload && systemctl enable wazuh-agent && systemctl start wazuh-agent


sed -i '10 s/'MANAGER_IP'/'132.226.255.149'/' /var/ossec/etc/ossec.conf
