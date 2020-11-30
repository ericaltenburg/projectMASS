#!/bin/bash

# cd's into all repos, fetches and grabs status then echos out total number of outdated repos

WORK_DONE=false
CHANGED_DIRECTORIES=()

function find_git {
	DIRECTORIES=$1
	for directs in $DIRECTORIES
	do
		cd $directs
		if [ -d .git ]
		then 
			# echo Peeking into $directs
			# echo Fetching Status...
			git fetch -q > .to_be_removed.txt
			rm .to_be_removed.txt
			echo $(git status) > .temp.txt
			if [ ! -z "$(grep "Untracked files" .temp.txt)" ] || [ ! -z "$(grep "Your branch is behind" .temp.txt)" ]
			then 
				CHANGED_DIRECTORIES+=( $directs )
				WORK_DONE=true
			fi
			rm .temp.txt
		else 
			find_git "*/"
		fi
		cd ..
	done
}

for i in */
do
	find_git "$i"
done

if [ "$WORK_DONE" == false ]
then
	echo "All repositories are up-to-date"
else 
	echo "Repositories out-of-date:"
	for d in ${CHANGED_DIRECTORIES[@]}
	do
		echo $d
	done
fi

