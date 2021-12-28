#!/bin/bash 
allsslfile=(`find /etc/nginx -type f -name '*.conf' | xargs grep  ssl_certificate | grep -v ssl_certificate_key | sed '/#/ d' | sed 's/[:;]//g' | sort | uniq | awk '{print $3}'`)
#reread aray 
sslfile=( $(printf '%s\n' "${allsslfile[@]}" | sort -u) )

length=${#sslfile[@]}
printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length;i++))
do

        printf '\n\t\t{'
                printf "\"{#SSL_CERTIFICATE}\":\"${sslfile[$i]}\"}"
                if [ $i -lt $[$length-1] ];then
                printf ','
        fi
done
printf  "\n\t]\n"
printf "}\n"
