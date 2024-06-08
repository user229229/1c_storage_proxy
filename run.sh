#!/bin/bash
/usr/sbin/apache2ctl start &
/opt/1cv8/x86_64/8.3.24.1548/crserver -d ${SRV1CV8_REPOSITORY} &
python3 /storage-proxy.py

