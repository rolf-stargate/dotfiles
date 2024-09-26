#!/bin/bash

# Run from /etc/udev/rules

TABLET="UGTABLET 21.5 inch PenDisplay Stylus Pen (0)"
MONITOR="DisplayPort-0"

xinput map-to-output $TABLET $MONITOR
