#!/bin/bash

cfg_file=_config.yml
msg="updated theme config"

cur_date=$(date +%d)
echo $((10#${cur_date}%2))
if [ $((10#${cur_date}%2)) -eq 0 ];
    then
        echo 'date is even'
        sed -i .bak 's/time-machine/cayman/' ${cfg_file}
    else
        echo 'date is odd'
        sed -i .bak "s/cayman/time-machine/" ${cfg_file}
fi
git add ${cfg_file}
git commit -a -m "${msg}"
git push