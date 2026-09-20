#!/bin/sh
bat=/sys/class/power_supply/BAT0
cap=$(cat "$bat/capacity")
status=$(cat "$bat/status")
echo "${status} ${cap}%"
