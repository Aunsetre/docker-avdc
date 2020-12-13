#! /bin/bash
set -e

FAILED_OUTPUT=${FAILED_OUTPUT:-"failed"}
SUCCESS_OUTPUT=${SUCCESS_OUTPUT:-"output"}
SOFT_LINK=${SOFT_LINK:-"0"}
FAILED_MOVE=${FAILED_MOVE:-"1"}
TRANSLATE=${TRANSLATE:-"1"}
PROXY_TYPE=${PROXY_TYPE:-"socks5"}
PROXY_URI=${PROXY_URI}
TIMEOUT=${TIMEOUT:-"5"}
RETRY=${RETRY:-"3"}
LOCATION_RULE=${LOCATION_RULE:-"actor+'/'+number"}
NAMING_RULE=${NAMING_RULE:-"number+'-'+title"}
MAX_TITLE_LEN=${MAX_TITLE_LEN:-"50"}
PRIORITY_WEBSITE=${PRIORITY_WEBSITE:-"javbus,javdb,fanza,xcity,mgstage,fc2,avsox,jav321,javlib,dlsite"}
ESCAPE_FOLDERS=${ESCAPE_FOLDERS:-"${SUCCESS_OUTPUT},${FAILED_OUTPUT}"}
DEBUG=${DEBUG:-"0"}

cd /app
cat>config.ini<<EOF
[common]
main_mode=1
failed_output_folder=failed
success_output_folder=output
soft_link=0
failed_move=1
auto_exit=0
transalte_to_sc=1

[proxy]
;proxytype: http or socks5 or socks5h switch: 0 1
switch=0
type=http
proxy=192.168.1.1:1080
timeout=5
retry=3

[Name_Rule]
location_rule=actor+'/'+number
naming_rule=number+'-'+title
max_title_len= 50

[update]
update_check=1

[priority]
website=javbus,javdb,fanza,xcity,mgstage,fc2,avsox,jav321,javlib,dlsite

[escape]
literals=\()/
folders=failed,output

[debug_mode]
switch=0

[transalte]
switch=0
values=title,outline
EOF

exec python AV_Data_Capture.py
