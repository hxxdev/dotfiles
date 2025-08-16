#!/bin/bash
output=$(hyprctl dispatch swapwindow l 2>&1)
if echo "$output" | grep -q "not found"; then
    hyprctl dispatch movewindow mon:l
fi
