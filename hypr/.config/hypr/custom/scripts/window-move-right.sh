#!/bin/bash
output=$(hyprctl dispatch swapwindow r 2>&1)
if echo "$output" | grep -q "not found"; then
    hyprctl dispatch movewindow mon:r
fi
