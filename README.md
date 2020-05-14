# AI/ML Docker Setup
Vanilla Docker Setup for AI/ML in python.


## Initial Setup
Download and install Docker on your machine: https://docs.docker.com/get-started/.

This should work out of the box if you have a Mac. If you use Windows or Linux, please see the additional instructions below.

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

## Running Jupyter Lab

Once you are running the docker image, you are logged into the virtual machine with a bash prompt. Because of a bug in Docker for Mac, you may run into an issue when running jupyter lab from the VM. So, in order to run Jupyter labs you will need to run the following command:

`$ jupyter lab --ip=0.0.0.0`

Once running, Jupyter Lab will provide you with a URL that looks similar to this:

`http://(456937b722b9 or 127.0.0.1):8888/?token=XYZ`

**Note:** Your "token" parameter will be different.

In order to access Jupyter Lab, copy the URL the terminal output, including the token, into your browser on your host machine.

`http://127.0.0.1:8888/?token=XYZ`

## Using RISE to preview presentation enabled notebooks

If you would like to view any notebooks that have RISE presentations, unfortunately, you cannot use Jupyter Lab. You must use Jupyter Notebook instead. You can run Jupyter Notebook by issuing the following command:

`jupyter notebook --ip=0.0.0.0`

and then proceeding as you would with Jupyter Lab.

## Optional: Using the start_jupyter.sh script

I have provided a jupyter startup script that will start jupyter notebook without a password. To use it, once you start the VM, execute the following command:

`start_jupyter.sh`

from the VM command line.

## Notes
1. There are a lot of software packages that will be installed, so be sure to have a fast internet connection and patience..

## Troubleshooting
### Permission denied on Jupyter notebook on *nix
If the Jupyter notebook is showing a popup showing 403 forbidden errors when trying to create a notebook in the code dir, the permissions need to be changed for the `code` directory. Try deleting the directory and creating it again using `rm -rf code && mkdir code`. If that doesn't work, you will need to use `sudo chmod 755 code` or `sudo chown $USER code` to set write permissions.
