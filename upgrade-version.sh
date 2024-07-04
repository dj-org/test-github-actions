#!/bin/bash

# Check if version is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <new_version>"
  exit 1
fi

NEW_VERSION=$1
FILE="build.txt"
# Update the version in build.txt
sed -i.bak "s/^version=.*/version=${NEW_VERSION}/" $FILE
echo "Version updated to ${NEW_VERSION} in $FILE"