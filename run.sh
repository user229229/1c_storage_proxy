#!/bin/bash
/usr/sbin/apache2ctl &
python3 /storage-proxy.py &
/opt/1cv8/x86_64/8.3.20.2290/crserver -d ${SRV1CV8_REPOSITORY}

