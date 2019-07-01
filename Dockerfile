FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

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
	python3-tk \
	libjpeg-dev \
	libpng-dev \
	python-opengl \
	xvfb && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get update && apt-get install -y nodejs

# install pip and AI/ML packages
RUN sudo python3 -m pip install pip --upgrade
RUN sudo python3 -m pip install numpy pandas scipy statsmodels mlxtend probscale matplotlib seaborn plotly bokeh pydot scikit-learn xgboost lightgbm catboost eli5 tensorflow keras theano nltk spacy gensim scrapy pybrain jupyterlab torch torchvision sympy pytest ipympl
RUN sudo python3 -m pip install git+https://github.com/drmaj/gridworldsgym#egg=gridworldsgym
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# setup user
RUN adduser --disabled-password --gecos '' --shell /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

ENV HOME=/home/user
RUN chmod 777 /home/user

#expose ports for jupyter lab and tensorboard
EXPOSE 6006
EXPOSE 8888

WORKDIR /home/user

COPY start_jupyter.sh start_jupyter.sh

CMD ["/bin/bash"]
#ENTRYPOINT ["jupyter", "lab"]
