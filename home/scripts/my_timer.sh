#!/bin/bash

let pause=$(cat /home/rolf/scripts/pause.txt)
let bar_num=$(cat /home/rolf/scripts/bar.txt | wc -m)

 if [ "$bar_num" -eq "0" ]; then

   if [ "$pause" -eq "0" ]; then
     echo 1 > /home/rolf/scripts/pause.txt
     pw-play ~/promo_notification.wav&
   fi
   echo 1 > /home/rolf/scripts/pause.txt

   > /home/rolf/scripts/bar.txt
 fi
 
 if [ "$pause" -eq "0" ]; then

   if((bar_num > 0)); then
     echo "$(cat /home/rolf/scripts/bar.txt) $((bar_num * 15 / 60))"
   fi

   if [ $(cat /home/rolf/script/bar.txt | grep -c '\.') -eq "0" ]; then
     > /home/rolf/scripts/bar.txt
     for((i = 0; i < $((bar_num - 1)); i++)); do
       echo -n ":" >> /home/rolf/scripts/bar.txt
     done
   else

   fi

 fi
