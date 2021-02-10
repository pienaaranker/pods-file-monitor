#!/bin/bash

if [ -d "$(PWD)/../Pods/" ]; then

  fswatch -0 "$(PWD)/../Pods/" | while read -d "" event
  do
    echo ${event}
    sh $(PWD)/sourcestream.sh ${event}
  done
fi
