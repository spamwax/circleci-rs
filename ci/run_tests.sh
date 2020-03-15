#!/bin/bash
[ -f res_dir/circleci ] && res_dir/circleci
if [[ -f res_dir/circleci ]]; then
    res_dir/circleci
    cat res_dir/circleci_temp.txt
else
    echo "Nope!"; exit 1
fi
