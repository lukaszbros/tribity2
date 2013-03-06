#!/bin/bash

cd ..
compass compile -c config_production.rb --force
coffee -o js/ -c coffee/

rm -rf release/
mkdir release/

cp --recursive css release/css
cp --recursive img release/img
cp --recursive js release/js
cp *.html release
cp *.png release
cp *.html release
cp *.ico release