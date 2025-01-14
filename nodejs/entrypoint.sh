#!/bin/bash 
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

cd /home/container || exit 1

# Print Node.js version
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mnode -v\n"
node -v

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")
printf "\033[1m\033[33mserver@sullivanshosting~ \033[0m%s\n" "$MODIFIED_STARTUP"

# Run the Server
exec env ${MODIFIED_STARTUP}
