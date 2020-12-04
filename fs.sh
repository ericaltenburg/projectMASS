#!/bin/bash

# cd's into all repos, fetches and grabs status then echos out total number of outdated repos

WORK_DONE=false
CHANGED_DIRECTORIES=()

function find_git {
	DIRECTORIES=$1
	for directs in $DIRECTORIES
	do
		PARENT_AND_CURRENT_DIRECTORY=$2
		cd $directs
		if [ -d .git ] # if the directory contains the .git folder
		then 
			git fetch -q > .to_be_removed.txt
			rm .to_be_removed.txt
			echo $(git status) > .git_status.txt
			if [ ! -z "$(grep "Untracked files\|Your branch is behind\|deleted:\|new file:\|modified:" .git_status.txt)" ]
			then 
				PARENT_AND_CURRENT_DIRECTORY+="$directs"
				CHANGED_DIRECTORIES+=( $PARENT_AND_CURRENT_DIRECTORY )
				WORK_DONE=true
			fi
			rm .git_status.txt
		elif [ "$(ls -A ".")" ] # Make sure the directory is not empty before calling into its children
		then
			PARENT_AND_CURRENT_DIRECTORY+="$directs"
			find_git "*/" "$PARENT_AND_CURRENT_DIRECTORY"
		fi
		cd ..
	done
}

for i in */
do
	FIRST_LAYER_DIRECTORY="$i"
	echo "Peeking into first-layer directory: $i"
	find_git "$i" "$FIRST_LAYER_DIRECTORY"
done

echo $'\nDone fetching statuses in repositories\n'

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

