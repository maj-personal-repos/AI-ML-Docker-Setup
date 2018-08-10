#!/bin/bash

docker run -it -p 8888:8888 -v `pwd`/code:/home/user/code ai-ml bash
