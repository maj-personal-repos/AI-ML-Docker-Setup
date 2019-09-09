#!/bin/bash

# you can change the path of the code dir here
code_dir="/Users/miguelalonsojr/Dropbox/FIU/Courses/CAP 5610 - Introduction to Machine Learning/repo"

#echo $code_dir


unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ $machine = "Mac" ]
then
	docker run -it -p 6006:6006 -p 8888:8888 -v "$code_dir":/home/user/code ai-ml bash
else
	docker run --user user -it -p 6006:6006 -p 8888:8888 -v "$code_dir":/home/user/code ai-ml bash
fi
