#!/usr/bin/env bash

echo "Enter description: "
read description
project=$(task $@ | grep -E '^Project' | tr -s ' ' | cut -d' ' -f2)
wait=$(task $@ | grep -E '^Waiting until' | tr -s ' ' | cut -d' ' -f3-)
tags=$(task $@ | grep -E '^Tags' | tr -s ' ' | cut -d' ' -f2-)

# echo $project
# echo $wait
# echo $(echo $tags | sed 's/ / +/g' | sed 's/^/+/' | sed 's/$/ +child/')

child_id=$(task add $description project:$project wait:$wait $(echo $tags | sed 's/ / +/g' | sed 's/^/+/' | sed 's/$/ +child/') | grep -E '^Created task'| cut -d' ' -f3 | sed 's/\.//')

# echo $child_id

task $@ modify depends:$child_id
