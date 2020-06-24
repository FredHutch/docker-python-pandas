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
	apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev
RUN cd /usr/local/ && \
	mkdir python && \
	apt install wget && \
	wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz && \
	tar -xzf Python-3.7.4.tgz && \
	cd Python-3.7.4 && \
	./configure && \
	make && \
	make install && \
	python3 --version && \
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	python3 get-pip.py
RUN apt install -y hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	pip3 install pandas==1.0.3 requests numpy && \
	pip3 install scipy statsmodels && \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
