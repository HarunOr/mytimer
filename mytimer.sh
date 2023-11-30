#!/bin/bash

# File to store the start time
START_TIME_FILE="$HOME/start_time.txt"

reset_timer() {
    if [ -f "$START_TIME_FILE" ]; then
        date +%s > "$START_TIME_FILE"
        echo "Timer reset"
    else
        echo "Timer start file does not exist. Cannot reset."
    fi
    exit 0
}

# Check for 'reset' argument
if [ "$1" == "reset" ]; then
    reset_timer
fi

# Initialize timer if not already set
if [ ! -f "$START_TIME_FILE" ]; then
    date +%s > "$START_TIME_FILE"
fi

# Read the start time from the file
start_time=$(cat "$START_TIME_FILE")
current_time=$(date +%s)
elapsed=$(( current_time - start_time ))

# Format and output the elapsed time in HH:mm:ss
printf "%02d:%02d:%02d\n" $((elapsed/3600)) $((elapsed%3600/60)) $((elapsed%60))
