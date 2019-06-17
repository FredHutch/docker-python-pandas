FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
	apt-get install -y build-essential python3 python3-pip

# Install Pandas from PyPI
RUN pip3 install pandas==0.24.2 requests tables
