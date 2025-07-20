#!/bin/sh

date=$(date +"%Y%m%d @ %T")

# Commit message
message="autocommit $date"
cd ~/Notes/obsidian-vault
git add .
git commit -m "$(message)"
status="$(git status --branch --porcelain)"
echo $status >>~/Notes/cron_echo.txt
if [ "$status" == "## master...origin/master" ]; then
	echo "IT IS CLEAN" >>~/cron_echo.txt
else
	echo "There is stuff to push" >>~/Notes/cron_echo.txt
	git push -u origin master
fi
