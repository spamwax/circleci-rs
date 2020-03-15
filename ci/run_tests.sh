#!/bin/bash
[ -f /tmp/res_dir/circleci ] \&\& /tmp/res_dir/circleci
if [[ -f /tmp/res_dir/circleci ]]; then
    /tmp/res_dir/circleci
    cat /tmp/res_dir/circleci_temp.txt
else
    echo "Nope!"; exit 1
fi
