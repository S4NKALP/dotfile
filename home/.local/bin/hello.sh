#!/usr/bin/sh

NAME="o0xjack"
APPNAME=609

# Set timezone to Asia/Kathmandu
timedatectl set-timezone Asia/Kathmandu

while true ; do

    datey=$(date +"%I %p")

    if [[ "$datey" == "12 AM" || "$datey" == "1 AM" || "$datey" == "2 AM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/face-devilish.svg "Demons are watching you..." -u low -a $APPNAME
    elif [[ "$datey" == "03 AM" || "$datey" == "04 AM" || "$datey" == "05 AM" || "$datey" == "06 AM" || "$datey" == "07 AM" || "$datey" == "08 AM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Good Morning" "$NAME!" -u low -a $APPNAME
    elif [[ "$datey" == "09 AM" || "$datey" == "10 AM" || "$datey" == "11 AM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Good Morning" "$NAME!" -u low -a $APPNAME
    elif [[ "$datey" == "12 PM" || "$datey" == "01 PM" || "$datey" == "02 PM" || "$datey" == "03 PM" || "$datey" == "04 PM" || "$datey" == "05 PM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Good Afternoon" "$NAME!" -u low -a $APPNAME
    elif [[ "$datey" == "06 PM" || "$datey" == "07 PM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Good Evening" "$NAME!" -u low -a $APPNAME
    elif [[  "$datey" == "11 PM" || "$datey" == "12 AM" ]] ; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/face-devilish.svg "Demons are watching you..." -u low -a $APPNAME
    elif [[ "$datey" == "10PM"  ]]; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Good Night" "$NAME!" -u low -a $APPNAME
    elif [[ "$datey" == "08 PM" || "$datey" == "09 PM"  ]]; then
        dunstify -i /usr/share/icons/Papirus-Dark/48x48/emotes/emote-love.svg "Nighty" "$NAME!" -u low -a $APPNAME
    fi
    sleep 3600

done
