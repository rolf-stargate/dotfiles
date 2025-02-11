#!/bin/bash

mbsync -Va

notmuch new

COUNT=$(notmuch count tag:inbox)
notmuch tag -tofilter tag:tofilter
if [ ${COUNT} != 0 ]; then
	notify-send "NEW MAIL" "${COUNT} new messages"
fi
