FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
	apt install -y build-essential python3 python3-pip libhdf5-serial-dev

# Install Pandas from PyPI
RUN pip3 install pandas==0.24.2 requests tables

# Install scipy and statsmodels
RUN pip3 install scipy statsmodels
