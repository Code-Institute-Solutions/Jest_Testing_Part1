#!/bin/bash

# Gives a personalised greeting
# Adds configuration options for SQLite
# Creates run aliases
# Author: Matt Rudge

clear
echo "Setting the greeting"
sed -i "s/USER_NAME/$GITPOD_GIT_USER_NAME/g" ${GITPOD_REPO_ROOT}/README.md
echo "Creating .sqliterc file"
echo ".headers on" > ~/.sqliterc
echo ".mode column" >> ~/.sqliterc
echo "Adding run aliases"
echo 'alias run="python3 $GITPOD_REPO_ROOT/manage.py runserver 0.0.0.0:8000"' >> ~/.bashrc
echo 'alias python=python3' >> ~/.bashrc
echo 'alias pip=pip3' >> ~/.bashrc
echo "Your workspace is ready to use. Happy coding!"
source ~/.bashrc
