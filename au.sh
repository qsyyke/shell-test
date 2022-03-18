#!/bin/bash

git add .
git commit -m "commit 时间`date +%Y.%m.%d`"
git tag -a `date +%Y.%m.%d` -m "tag 提交时间`date`"
