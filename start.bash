#!/bin/bash
x11vnc -create &
sleep 15s
. omnetpp-6.1/setenv
omnetpp-6.1/bin/opp_ide
sleep 1m
while pgrep -x "opp_ide" > /dev/null; do
    sleep 1m
done