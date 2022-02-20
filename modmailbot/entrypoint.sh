#!/bin/ash

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

cd /home/container || exit 1

printf "\033[1m\033[33mserver@SullivansHosting~ \033[0mnode -v\n"
node -v

MODIFIED_STARTUP=$(echo "MM_TOKEN=${MM_TOKEN} MM_MAIN_SERVER_ID=${MM_MAIN_SERVER_ID} MM_INBOX_SERVER_ID=${MM_INBOX_SERVER_ID} MM_LOG_CHANNEL_ID=${MM_LOG_CHANNEL_ID} node /home/container/src/index.js" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")
printf "\033[1m\033[33mserver@sullivanshosting~ \033[0m%s\n" "Starting ModMailBot"
# Run the Server
exec env ${MODIFIED_STARTUP}
