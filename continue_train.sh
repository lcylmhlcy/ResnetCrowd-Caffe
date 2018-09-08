#!/usr/bin/env sh
set -e

./build/tools/caffe train --solver=examples/ResnetCrowd/resnetcrowd_solver.prototxt --snapshot=examples/ResnetCrowd/rescrowd_iter_10000.solverstate --gpu=1
