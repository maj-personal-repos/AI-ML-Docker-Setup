FROM ubuntu:18.04

# basic package install
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && apt-get install -y \
	build-essential \
	curl \
	ca-certificates \
	sudo \
	git \
	vim \
	python3-dev \
	python3-pip \
	libjpeg-dev \
	libpng-dev && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN sudo python3 -m pip install pip --upgrade
RUN sudo python3 -m pip install numpy==1.14.5 pandas scipy statsmodels matplotlib seaborn plotly bokeh pydot scikit-learn xgboost lightgbm catboost eli5 tensorflow keras theano nltk spacy gensim scrapy pybrain jupyterlab http://download.pytorch.org/whl/cpu/torch-0.4.1-cp36-cp36m-linux_x86_64.whl torchvision

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN adduser --disabled-password --gecos '' --shell /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

ENV HOME=/home/user
RUN chmod 777 /home/user

EXPOSE 6006
EXPOSE 8888

WORKDIR /home/user

#COPY ./code/Pipfile Pipfile
#RUN set -ex && pipenv install --deploy --system

CMD ["/bin/bash"]

