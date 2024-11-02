#!/bin/bash
set -ex

export HDF5_DIR=${PREFIX}

mkdir builddir

python -m build -w -n -x \
    -Cbuilddir=builddir \
    -Cinstall-args=--tags=runtime,python-runtime,devel \
    -Csetup-args=-Dapp=true \
    -Csetup-args=-Dnav=true \
    -Csetup-args=-Duse-vtk=true \
    || (cat builddir/meson-logs/meson-log.txt && exit 1)

python -m pip install dist/pycgns*.whl
