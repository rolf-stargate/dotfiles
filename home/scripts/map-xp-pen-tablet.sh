#!/bin/bash

# Run from /etc/udev/rules

ERR=xinput map-to-output "UGTABLET 21.5 inch PenDisplay Stylus Pen (0)" DisplayPort-0
echo "$(date)-->ERR" >> /home/rolf/foo/debug.log
