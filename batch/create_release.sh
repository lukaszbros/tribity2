#!/bin/bash

cd ..
compass compile -c config_production.rb --force
coffee -o js/ --join main -c coffee/

rm -rf release/
mkdir release/

cp --recursive css release/css
cp --recursive img release/img
cp --recursive js release/js
cp --recursive php release/php
cp *.html release
cp *.png release
cp *.html release
cp *.ico release
cp *.php release
sed -i s/\'UA-XXXXX-X\'/\'UA-38521837-1\'/g ./release/index.html