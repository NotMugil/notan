#!/bin/bash

set -e

active=""
inactive=""

workspace_str=""

monitor=$1

reading_output=0
while read -r line; do
	if [ $reading_output -eq 0 ] && [ "$(echo "$line" | cut -d ' ' -f 2)" = "\"$monitor\":" ]; then
		reading_output=1
		continue
	elif [ $reading_output -eq 1 ]; then
		if [ -z "$line" ]; then
			printf "%s" "$workspace_str"
			exit
		fi

		if [ "$(echo "$line" | head -c 1)" = '*' ]; then
			workspace_str="${workspace_str}${active}  "
		else
			workspace_str="${workspace_str}${inactive}  "
		fi
	fi
done <<<"$(niri msg workspaces)"

printf "%s" "$workspace_str"
