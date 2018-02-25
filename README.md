# git-commit-timeline
Utility to show a histogram plot timeline of commits to your githup repositories

![alt text](https://github.com/js040/git-commit-timeline/blob/master/doc/image1.png)

# Installation

## Requirements
Make sure the following can be found in your path.
* GNU Utils (e.g. grep, sed, awk) [installed usually on all systems]
* Spark (https://github.com/holman/spark)

# Running

Step 1) Run fetch-git-info.sh on some time interval (e.g every 10 minutes). This can be done in several ways:

	A) Set up a cron job

		In OSX, you need to go to:
		```
		env EDITOR=nano crontab -e
		```

		and then to run fetch-git-info.sh every 10 minutes

		```
		*/10 * * * * /path/to/fetch-git-info.sh > /dev/null 2>&1
		```

	B) More crudely, you could open a shell and run this command to check every 10 minutes
		```
		while true; do /path/to/fetch-git-info.sh; sleep 600; done
		```

	C) This is option B), but running the command in the backround (i.e. you would have to manually kill the process or session to stop the command)
		```
		sh -c 'while true; do /path/to/fetch-git-info.sh; sleep 600; done' &
		```