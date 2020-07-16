#!/bin/bash

# cd's into all repos, fetches and grabs status then echos out total number of outdated repos

DIRECTORIES=*/
WORK_DONE=false

for directs in $DIRECTORIES
do
	cd $directs 
	git fetch
	git status > .tempxyz.txt
	if [[ -z $(grep nothing .tempxyz.txt) ]]; then
		echo "$directs"
		WORK_DONE=true
	fi

	if [[ ! -z $(grep behind .tempxyz.txt) ]]; then
		echo "$directs"
		WORK_DONE=true
	fi
	rm .tempxyz.txt
	cd - > /dev/null
done

if [ "$WORK_DONE" == false ]; then
	echo "All repositories are up-to-date"
fi

