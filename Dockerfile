FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install
#  - python3
#  - HDF5
#  - pandas
#  - requests
#  - numpy
#  - scipy
#  - statsmodels
#  - tables
RUN apt update && \
	apt install -y build-essential python3 python3-pip && \
	apt install -y hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	pip3 install pandas==0.24.2 requests numpy && \
	pip3 install scipy statsmodels && \
    HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
