#!/bin/bash

INTERVAL=300

CMD1="ssh -f -N -L 8080:localhost:80 zabbix.lan"

echo "Executing $CMD1, refresh interval: $INTERVAL seconds"

trap "echo \"Caught SIGINT\"; pgrep -f \"$CMD1\" | xargs kill; ssh-agent -k; exit" SIGINT

eval $(ssh-agent)
ssh-add

while true
do
        pgrep -f "$CMD1" &>/dev/null && echo "$(date +'%Y.%m.%d %H:%M:%S'): OK" || ( echo "$(date +'%Y.%m.%d %H:%M:%S'): Reconnecting..."; $CMD1 & )
        sleep $INTERVAL
done

