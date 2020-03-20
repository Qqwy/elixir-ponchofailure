#!/bin/sh
echo "building JS dependencies for the" $1 "environment"
cd ./assets && npm install && node node_modules/webpack/bin/webpack.js --mode $1
