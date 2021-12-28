# zabbix-nginx-ssl-discovery-and-monitoring
scans for ssl_certificate in /etc/nginx and adds to zabbix monitoring

copy ssl_check.sh and ssl_finder.sh to zabbix script directory
copy userparameter_sslcertificate.conf to zabbix user parameters directory

grant chmod +x permissions for those files

import zabbix template zbx_export_ssl_discovery_and_monitoring_template.xml to the zabbix

assign template to host

note:

depending on the mess you have on the webserver it could require ammending ssl_finder.sh with find location and "awk '{print $3}') to correctly catch ssl file locations.
