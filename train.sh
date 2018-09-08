#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/ResnetCrowd/resnetcrowd_solver.prototxt --gpu=0
