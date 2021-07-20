#!/usr/bin/env bash

FILE=config.yml
if test -f "$FILE"; then
    echo "$FILE exists"
else
    echo "$FILE does not exist"
    exit 2
fi