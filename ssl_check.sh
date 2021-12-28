#!/bin/bash 
date=$(openssl x509 -enddate -noout -in $1 | sed "s/.*=\(.*\)/\1/")
      date_s=$(date -d "${date}" +%s)
            now_s=$(date -d now +%s)
                  date_diff=$(( (date_s - now_s) / 86400 ))
                        echo "$date_diff"
