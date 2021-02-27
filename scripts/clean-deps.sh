#!/bin/bash

# A script for nuking React Native dependencies

# Stop cached listeners
watchman watch-del-all

# Remove installed modules
rm -rf node_modules
rm -rf ios/Pods
rm -rf ios/DerivedData
rm -rf android/build
rm -rf android/app/build

# Install only fresh copies
yarn cache clean
yarn
cd ios && pod install && cd ..

# Kill any other instance of the packager
lsof -ti:8081 | xargs kill

echo "FINISHED CLEANING DEPS"
