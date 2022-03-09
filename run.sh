#!/bin/bash

just postgres $1 --engine Dask --enable-cx > log/pg_dask_$1_cx.log 2>&1
just postgres $1 --engine Dask --enable-cx >> log/pg_dask_$1_cx.log 2>&1
just postgres $1 --engine Dask --enable-cx >> log/pg_dask_$1_cx.log 2>&1
just postgres $1 --engine Dask --enable-cx >> log/pg_dask_$1_cx.log 2>&1

just postgres $1 --engine Dask > log/pg_dask_$1.log 2>&1
just postgres $1 --engine Dask >> log/pg_dask_$1.log 2>&1
just postgres $1 --engine Dask >> log/pg_dask_$1.log 2>&1
just postgres $1 --engine Dask >> log/pg_dask_$1.log 2>&1

just postgres $1 --engine Ray --enable-cx > log/pg_ray_$1_cx.log 2>&1
just postgres $1 --engine Ray --enable-cx >> log/pg_ray_$1_cx.log 2>&1
just postgres $1 --engine Ray --enable-cx >> log/pg_ray_$1_cx.log 2>&1
just postgres $1 --engine Ray --enable-cx >> log/pg_ray_$1_cx.log 2>&1

just postgres $1 --engine Ray > log/pg_ray_$1.log 2>&1
just postgres $1 --engine Ray >> log/pg_ray_$1.log 2>&1
just postgres $1 --engine Ray >> log/pg_ray_$1.log 2>&1
just postgres $1 --engine Ray >> log/pg_ray_$1.log 2>&1
