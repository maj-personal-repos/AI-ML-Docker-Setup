#!/bin/bash

# you can change the path of the code dir here
code_dir=$PWD/code

echo $code_dir

docker run -it -p 6006:6006 -p 8888:8888 -v "$code_dir":/home/user/code ai-ml bash
