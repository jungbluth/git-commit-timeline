# git-commit-timeline
Utility to show a histogram plot timeline of commits to your githup repositories. By default, it is set to show the last 45 days of activity, which fits nicely in a narrow terminal pane (~8-10 cm on-screen.)

![alt text](https://github.com/js040/git-commit-timeline/blob/master/doc/image1.png)

# Installation

## Requirements
Make sure the following can be found in your path.
* GNU Utils (e.g. grep, sed, awk) [installed usually on all systems]
* Spark (https://github.com/holman/spark)

# Running

## 1. Run fetch-git-info.sh on some time interval (e.g every 10 minutes). This can be done in several ways:

###  * Set up a cron job

In OSX, you need to go to 
```
env EDITOR=nano crontab -e
```

and then to run fetch-git-info.sh every 10 minutes

```
*/10 * * * * /path/to/fetch-git-info.sh > /dev/null 2>&1
```

###  * Run in an endless loop

You could open a shell and run this command to check every 10 minutes
```
while true; do /path/to/fetch-git-info.sh; sleep 600; done
```

To extend the previous example, you could run the command in the backround (i.e. you would have to manually kill the process or session to stop the command)
```
sh -c 'while true; do /path/to/fetch-git-info.sh; sleep 600; done' &
```

## 2. Run git-commit-timeline.sh to load the required shell functions

```
/path/to/git-commit-timeline.sh
```

Now the functions that read the temporary files being generated in Step 1 are loaded up. Once fetch-git-info.sh has run one full cycle (usually takes a few minutes depending on your repository size), then you can run the following command to see a histogram of your git commits.

```
gitcommitchecker
```

If all worked, then you should see a histogram appear.

If you'd like to run this on a loop, the command is as follows (default: checks every 20 minutes):

```
rungitcommitchecker
```

If all worked, then you should see a histogram appear every five minutes showing a timeline of your latest commits.

## 3. Explanation of output

![alt text](https://github.com/js040/git-commit-timeline/blob/master/doc/image2.png)
