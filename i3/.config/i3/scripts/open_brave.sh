#!/bin/bash

# move to workspace 3:
i3-msg workspace 7;

# run the application
brave &
pid="$!"
echo $pid

#Wait for the window to open and grab its window ID
winid=''
while : ; do
    winid="wmctrl -lp "
		echo $winid
    [[ -z "${winid}" ]] || break
done

#Focus the window we found
wmctrl -ia "${winid}"

# # in case you still have inconsistencies (should not be required):
# sleep 0.2

i3-msg workspace 9;
brave
