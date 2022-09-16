FROM quay.io/hdc-workflows/python
MAINTAINER sminot@fredhutch.org

RUN pip3 install pandas==1.2.1 requests numpy h5py && \
	pip3 install scipy statsmodels fastdist fastcluster \
	numba pyarrow direct-redis scikit-learn  bitarray \
	pysam biopython jinja2 \
	&& \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
