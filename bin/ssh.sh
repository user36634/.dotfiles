#!/usr/bin/env bash

printf "\e]1;`echo $* | sed -Ee 's/^.+\@//'`\a"
ssh $*
printf "\e]1;bash\a"
