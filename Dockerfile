FROM python:3.8.2-slim
MAINTAINER sminot@fredhutch.org

# Install
#  - HDF5
#  - pandas
#  - requests
#  - numpy
#  - scipy
#  - statsmodels
#  - tables
RUN apt update && \
	apt install -y build-essential && \
	apt install -y hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	pip3 install pandas==1.0.3 requests numpy && \
	pip3 install scipy statsmodels && \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
