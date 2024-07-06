#!/bin/bash

FILE="build.txt"
# Get the version from build.txt
VERSION=$(awk -F'=' '/^version=/ {print $2}' "$FILE")
echo "Current version is $VERSION"
#if version is empty, exit
if [ -z "$VERSION" ]; then
  echo "Version not found in $FILE"
  exit 1
fi
#Add -SNAPSHOT to the version
NEW_VERSION="${VERSION}-SNAPSHOT"
echo "New version is $NEW_VERSION"
# Set the new version in build.txt
sed -i.bak "s/^version=.*/version=${NEW_VERSION}/" $FILE