#!/bin/bash

# Configuration
SLEEP_INTERVAL=10
NOTIFY_INTERVAL=60  # Notify every 60 loops (10 minutes)
LOCK_FILE="/tmp/check_mail.lock"

# Ensure single instance
if ! (set -o noclobber; echo "$$" > "$LOCK_FILE") 2>/dev/null; then
    echo "Script is already running" >&2
    exit 1
fi
trap 'rm -f "$LOCK_FILE"; exit' EXIT

# Initialize counters
loop_count=1
last_count=0

while true; do
    # Sync mail
    if ! muchsync protonmail@stargate-mail; then
        echo "Error: muchsync failed" >&2
        sleep "$SLEEP_INTERVAL"
        continue
    fi

    # Get new mail count
    new_count=$(notmuch count tag:inbox)
    if (( new_count != 0 && loop_count >= NOTIFY_INTERVAL )) || \
       (( new_count != last_count )); then
        if ! notify-send "New Mail" "You have $new_count new message(s)"; then
            echo "Error: Failed to send notification" >&2
        fi
        last_count=$new_count
        loop_count=0
    fi

    sleep "$SLEEP_INTERVAL"
    ((loop_count++))
done
