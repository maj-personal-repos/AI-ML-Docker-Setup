SET code_dir=%cd%/code


docker run --platform linux -it -p 6006:6006 -p 8888:8888 -v %code_dir%:/home/user/code ai-ml bash
