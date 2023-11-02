FROM quay.io/hdc-workflows/python
MAINTAINER sminot@fredhutch.org

RUN pip3 install pandas==1.2.1 requests numpy==1.23.5 h5py && \
	pip3 install scipy statsmodels fastdist fastcluster \
	numba pyarrow direct-redis scikit-learn  bitarray \
	pysam biopython jinja2 umap-learn widgets-lib \
	anndata scanpy vitessce \
	&& \
	HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
