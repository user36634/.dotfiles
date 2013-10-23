#!/usr/bin/env bash

printf "\e]1;`echo $* | sed -Ee 's/^.+\@//'`\a"
mosh $*
printf "\e]1;bash\a"
