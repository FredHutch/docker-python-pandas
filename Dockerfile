FROM ubuntu:20.04
MAINTAINER sminot@fredhutch.org

# Install
#  - Python 3.7
#  - HDF5
#  - pandas
#  - requests
#  - numpy
#  - scipy
#  - statsmodels
#  - tables
RUN apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev

RUN cd /usr/local/ && \
	mkdir python && \
	apt install wget && \
	wget --quiet https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz && \
	tar -xzf Python-3.7.4.tgz && \
	cd Python-3.7.4 && \
	./configure && \
	make && \
	make install && \
	python3 --version && \
	apt install -y curl && \
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py

RUN pip3 install pandas==1.0.3 requests numpy h5py && \
	pip3 install scipy statsmodels && \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
