#!/bin/bash

qutebrowser-tmp $1 >/dev/null 2>&1 & disown -a
