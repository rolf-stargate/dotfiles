#!/bin/bash

# Run from /etc/udev/rules

ERR=$(xinput map-to-output "UGTABLET 21.5 inch PenDisplay Mouse" DisplayPort-0 2>&1)
echo "$(date)--> $ERR" >> /home/rolf/foo/debug.log
