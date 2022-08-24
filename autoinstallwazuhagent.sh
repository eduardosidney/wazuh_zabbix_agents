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



systemctl restart wazuh-agent.service

systemctl status wazuh-agent.service





#Solution:
#This error indicates that the server.address field in the /var/ossec/etc/ossec.conf file does not contain a valid IP address.

#To fix this run the command
#sudo vim /var/ossec/etc/ossec.conf


#and change the server.address field to whatever you're server IP address is(127.0.0.1 in my case)


#Here the section of the /var/ossec/etc/ossec.conf file where you need to make the change:

#...
#<client>
#    <server>
#      <address>127.0.0.1</address>
#      <port>1514</port>
#      <protocol>tcp</protocol>
#    </server>
#    <config-profile>ubuntu, ubuntu20, ubuntu20.04</config-profile>
#    <notify_time>10</notify_time>
#    <time-reconnect>60</time-reconnect>
#    <auto_restart>yes</auto_restart>
#    <crypto_method>aes</crypto_method>
#</client>
#...
