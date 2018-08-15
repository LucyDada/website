#!/bin/bash

echo -e "Deploying updates to website... "

msg="site update - `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Commit source changes
git add .
git commit -m "$msg"

# Pull any upstream changes, then Push cpde
git pull origin master -v
git push origin master -v

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit build changes
git commit -m "$msg"

# Pull any upstream changes, then Push build
git pull origin master -v
git push origin master -v

# Come Back up to the Project Root
cd ..
