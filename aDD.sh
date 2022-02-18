#!/bin/bash

git add .
echo "Type commit :"
read msg

git config --global user.name "Dishank"
git config --global user.email "pateldishank64@gmail.com"
git commit -m $msg
#git push
#echo "Hii"
#ping google.com

