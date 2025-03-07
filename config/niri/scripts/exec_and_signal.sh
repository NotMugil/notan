#!/bin/sh

niri msg action $1
pkill -SIGRTMIN+8 waybar
