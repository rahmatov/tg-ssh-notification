# save it on /etc/profile/profile.d/
USERID="<user_or_group_id>"
KEY="<telegram_bot_api_key>"
URL="https://api.telegram.org/bot$KEY/sendMessage"
if [ -n "$SSH_CLIENT" ]; then
    DATE_EXEC="$(date "+%d %b %Y %H:%M")"
    IP=$(echo $SSH_CLIENT|awk '{print $1}')
    PORT=$(echo $SSH_CLIENT|awk '{print $3}')
    HOSTNAME=$(hostname -f)
    IPADDR=$(hostname -I)
    TEXT="$DATE_EXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP on port $PORT"
    curl -s -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
fi
