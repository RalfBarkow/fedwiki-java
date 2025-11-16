#!/bin/sh
# run test data as command input
# usage: [DEBUG=1|2] sh test.sh [site]

SITE=${1:-ward.dojo.fed.wiki}   # default to 'ward.dojo.fed.wiki' if no argument passed

cat input.txt | DEBUG=$DEBUG sh run.sh "$SITE"
