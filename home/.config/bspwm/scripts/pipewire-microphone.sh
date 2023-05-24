#!/bin/sh

get_mic_default() {
    pactl info | grep -E "Default Source: " | sed -n -e 's/^.*: //p'
}

is_mic_muted() {
    mic_name="$(get_mic_default)"

    pactl list sources | \
        awk -v mic_name="${mic_name}" '{
            if ($0 ~ "Name: " mic_name) {
                matched_mic_name = 1;
            } else if (matched_mic_name && /Mute/) {
                print $2;
                exit;
            }
        }'
}

get_mic_status() {
    is_muted="$(is_mic_muted)"
    mic_name="$(get_mic_default)"

    if [ "${is_muted}" = "yes" ]; then
        printf "%s\n" "󰍭"
    else
        volume=$(pactl get-source-volume "$mic_name" | grep Volume | awk -F/ '{print $2}' | tr -d ' ')
        echo "󰍬 "$volume""
    fi
}

listen() {
    get_mic_status

    LANG=EN; pactl subscribe | while read -r event; do
        if printf "%s\n" "${event}" | grep --quiet "source" || printf "%s\n" "${event}" | grep --quiet "server"; then
            get_mic_status
        fi
    done
}

toggle() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

increase() {
  DEFAULT_SOURCE="$(get_mic_default)"
  pactl set-source-volume "$DEFAULT_SOURCE" +5%
}

decrease() {
  DEFAULT_SOURCE="$(get_mic_default)"
  pactl set-source-volume "$DEFAULT_SOURCE" -5%
}

case "$1" in
    --toggle)
        toggle
        ;;
    --increase)
        increase
        ;;
    --decrease)
        decrease
        ;;
    *)
        listen
        ;;
esac
