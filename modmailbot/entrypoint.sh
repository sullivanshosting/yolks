#!/bin/bash 
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Print Node.js Version
node -v


# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"
CONFIG="MM_TOKEN=${TOKEN} MM_MAIN_SERVER_ID=${MAIN_SERVER_ID} MM_INBOX_SERVER_ID=${INBOX_SERVER_ID} MM_LOG_CHANNEL_ID=${LOG_CHANNEL_ID}"
# Run the Server
eval ${CONFIG} ${MODIFIED_STARTUP}
