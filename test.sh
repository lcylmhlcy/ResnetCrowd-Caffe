#!/usr/bin/env sh
set -e

./build/tools/caffe test -model=examples/ResnetCrowd/resnetcrowd_train.prototxt -weights=examples/ResnetCrowd/rescrowd_iter_5000.caffemodel --gpu=1
