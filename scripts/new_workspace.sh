#!/bin/bash

LAST_WORKSPACE=$(i3-msg -t get_workspaces | sed -e 's/^.*"num":\([0-9]\).*$/\1/g')
i3-msg workspace $(($LAST_WORKSPACE+1))

