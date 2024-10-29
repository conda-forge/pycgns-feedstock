#!/bin/bash

export HDF5_DIR=${PREFIX}

python setup.py build  --app False --nav False

python setup.py install --prefix=${PREFIX} --app False --nav False
