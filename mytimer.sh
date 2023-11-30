#!/bin/bash

# File to store the start time
START_TIME_FILE="$HOME/start_time.txt"

# Start timer
start_timer() {
    date +%s > "$START_TIME_FILE"
    echo "Timer started"
}

# Stop timer
stop_timer() {
    if [ -f "$START_TIME_FILE" ]; then
        rm "$START_TIME_FILE"
        echo "Timer stopped"
    else
        echo "Timer is not running."
    fi
}

# Main script logic
case "$1" in
    start)
        start_timer
        ;;
    stop)
        stop_timer
        ;;
    reset)
        start_timer
        ;;
    *)
        if [ -f "$START_TIME_FILE" ]; then
            start_time=$(cat "$START_TIME_FILE")
            current_time=$(date +%s)
            elapsed=$(( current_time - start_time ))
            printf "%02d:%02d:%02d\n" $((elapsed/3600)) $((elapsed%3600/60)) $((elapsed%60))
        else
            echo "Timer is not running. Use 'mytimer start' to begin."
        fi
        ;;
esac
