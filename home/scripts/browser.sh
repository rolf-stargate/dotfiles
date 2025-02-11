#!/bin/bash

qutebrowser_tmp $1 >/dev/null 2>&1 & disown -a
