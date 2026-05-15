#!/bin/bash
set -ex

cmake -B build -S . \
  ${CMAKE_ARGS} \
  -GNinja \
  -DMPI_RUN_RESULT_C_libver_mpi_normal=0 \
  -DMPI_RUN_RESULT_C_libver_mpi_normal__TRYRUN_OUTPUT="SUCCESS" \
  -DMPI_RUN_RESULT_CXX_libver_mpi_normal=0 \
  -DMPI_RUN_RESULT_CXX_libver_mpi_normal__TRYRUN_OUTPUT="SUCCESS" \
  -DMPI_RUN_RESULT_Fortran_libver_mpi_F08_MODULE=0 \
  -DMPI_RUN_RESULT_Fortran_libver_mpi_F08_MODULE__TRYRUN_OUTPUT="SUCCESS" \
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
  -DSIRIUS_USE_PUGIXML="ON" \
  -DSIRIUS_USE_SCALAPACK="ON" \
  -DSIRIUS_USE_VDWXC="OFF"
cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
