
#!/bin/bash

NGROKCOMMAND="ngrok http https://localhost"
SLACKWEBHOOK="https://hooks.slack.com/services/<TOKEN>/<TOKEN>/<TOKEN>"


echo "Starting nGROK"
gnome-terminal -- $NGROKCOMMAND
sleep 2


NGURL=$(curl --silent http://localhost:4040/api/tunnels | jq -r '.tunnels[1].public_url')


curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Access URL is now:\r\n${NGURL}\"}" $SLACKWEBHOOK
