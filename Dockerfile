FROM ubuntu:20.04
MAINTAINER sminot@fredhutch.org

# Install
#  - Python
#  - HDF5
#  - pandas
#  - requests
#  - numpy
#  - scipy
#  - statsmodels
#  - tables
#  - h5py
RUN apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev && \
	apt install -y python3 python3-pip

# Install redis
RUN mkdir /usr/local/redis && \
	cd /usr/local/redis && \
	wget http://download.redis.io/redis-stable.tar.gz && \
	tar xvzf redis-stable.tar.gz && \
	cd redis-stable  && \
	make  && \
	make test

RUN pip3 install pandas==1.2.1 requests numpy h5py && \
	pip3 install scipy statsmodels fastdist numba pyarrow direct-redis && \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
