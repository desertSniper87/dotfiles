#!/bin/bash
# Author            : desertsniper87 <torshobuet@gmail.com>
# Date              : 26.05.2020
# Last Modified Date: 26.05.2020

if [ $# -lt 2 ] ; then
    echo 'Need two arguments'
    exit 1
fi

diff1="jq -S . $1"
diff2="jq -S . $2"

vimdiff <($diff1) <($diff2)

