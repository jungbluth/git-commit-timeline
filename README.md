# git-commit-timeline
Utility to show a histogram plot timeline of commits to your githup repositories. By default, it is set to show the last 45 days of activity, which fits nicely in a narrow terminal pane (~8-10 cm on-screen.)

![alt text](https://github.com/js040/git-commit-timeline/blob/master/doc/image1.png)

# Installation

## Requirements
Make sure the following can be found in your path.
* GNU Utils (e.g. grep, sed, awk) [installed usually on all systems]
* Spark (https://github.com/holman/spark)

# Running

## 1. Set the parent folder for all your git repositories (assumption is that one parent folder contains them all)


## 2. Run git-commit-timeline.sh to load the required shell functions


```
/path/to/git-commit-timeline.sh
```

## 3. Run rungitcommitchecker and provide the path to your github repositories as the first (and only argument)

```
rungitcommitchecker /path/to/github-repositories
```

If all worked, then you should see a histogram appear every ten minutes showing a timeline of your latest commits.

## 3. Explanation of output

![alt text](https://github.com/js040/git-commit-timeline/blob/master/doc/image2.png)
