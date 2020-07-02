#!/bin/bash

cfg_file=_config.yml
msg="updated theme config"

cur_date=`date +%d`
# cur_date=$(date +%d)
echo $((10#${cur_date}%2))
if [ $((10#${cur_date}%2)) -eq 0 ];
    then
        echo 'date is even'
        sed 's/time-machine/cayman/' ${cfg_file} > ${cfg_file}.bak
        # sed -i .bak 's/time-machine/cayman/' ${cfg_file}
    else
        echo 'date is odd'
        sed "s/cayman/time-machine/" ${cfg_file} > ${cfg_file}.bak
        # sed -i .bak "s/cayman/time-machine/" ${cfg_file}
fi
rm ${cfg_file}
mv ${cfg_file}.bak ${cfg_file}

git config --global user.email "vsilverman@gmail.com"
git config --global user.name "vsilverman"

git add ${cfg_file}
git commit -a -m "${msg}"
git push origin HEAD:master