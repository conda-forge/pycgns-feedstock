#!/bin/bash
set -ex

export HDF5_DIR=${PREFIX}

mkdir corebuilddir

python -m build -w -n -x \
    -Cbuilddir=corebuilddir \
    -Cinstall-args=--tags=runtime,python-runtime,devel \
    -Csetup-args=-Dapp=false \
    -Csetup-args=-Dnav=false \
    -Csetup-args=-Duse-vtk=false \
    || (cat builddir/meson-logs/meson-log.txt && exit 1)

python -m pip install dist/pycgns*.whl
