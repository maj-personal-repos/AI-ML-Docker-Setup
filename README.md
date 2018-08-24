# AI-ML-Docker-Setup
Vanilla Docker Setup for AI/ML in python.


## Initial Setup 
Download and install Docker on your machine: https://docs.docker.com/get-started/. 

### Linux Specific Instructions
It's probably not a good idea to run Docker as root. You can add your username to the docker group by running the following command in the terminal:

`sudo usermod -aG docker your-user`

You can read more about it [here](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-convenience-script).

### Windows Specific Instructions
If you are running Docker on windows, you will have to enable experimental features. You can find instructions on how to do that [here](https://docs.docker.com/docker-for-windows/#experimental-mode).

## Install Virtual Machine
Once you have installed Docker installed, use the script provided to run the installation.

`$ ./setup_docker.sh`

## Run Virtual Machine
Once the installation is complete, run the Docker machine using the provided script:

`$ ./run_docker.sh`

If you are running Docker for Windows, you will need to create a code subdirectory where you cloned the repository. For example, say that you cloned the repo to

`C:/Users/JohnDoe/AI-ML-Docker-Setup`

You will need to create the code subdirectory as follows:

`C:/Users/JohnDoe/AI-ML-Docker-Setup/code`

You will then need to make the docker daemon aware of this directory to enable the mapping. Instructions for how to do that are found [here](https://docs.docker.com/docker-for-windows/#shared-drives).

## Running Jupyter Labs

Because of a bug in Docker for Mac, you may run into an issue when running jupyter lab from the VM. So, in order to run Jupyter labs you will need to run the following command:

`$ jupyter lab --ip=* `

Once running, Jupyter labs will provide you with a URL that looks similar to this:

`http://(456937b722b9 or 127.0.0.1):8888/?token=XYZ`

**Note:** Your "token" parameter will be different. 

In order to access Jupyter Labs, copy the URL the terminal output, including the token, into your browser on your host machine. 

`http://127.0.0.1:8888/?token=XYZ`
