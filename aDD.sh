#! /bin/bash

git add .
echo "Type commit :"
read msg

git commit -m $msg
git push


