#!/bin/bash
set -ex

export CXX=mpicxx CC=mpicc FC=mpif90

cmake -B build -S . \
  ${CMAKE_ARGS} \
  -GNinja \
  -DSIRIUS_CREATE_FORTRAN_BINDINGS="ON" \
  -DSIRIUS_CREATE_PYTHON_MODULE="OFF" \
  -DSIRIUS_USE_DFTD3="OFF" \
  -DSIRIUS_USE_DFTD4="OFF" \
  -DSIRIUS_USE_DLAF="OFF" \
  -DSIRIUS_USE_ELPA="OFF" \
  -DSIRIUS_USE_FP32="OFF" \
  -DSIRIUS_USE_MEMORY_POOL="OFF" \
  -DSIRIUS_USE_MKL="OFF" \
  -DSIRIUS_USE_OPENMP="ON" \
  -DSIRIUS_USE_SCALAPACK="ON" \
  -DSIRIUS_USE_VDWXC="OFF"
cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
