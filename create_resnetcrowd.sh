#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs
set -e

EXAMPLE=examples/ResnetCrowd
DATA=examples/ResnetCrowd/data/
TOOLS=build/tools

TRAIN_DATA_ROOT=examples/ResnetCrowd/train/
VAL_DATA_ROOT=examples/ResnetCrowd/val/

rm -rf $EXAMPLE/resnetcrowd_train_lmdb
rm -rf $EXAMPLE/resnetcrowd_val_lmdb

# Set RESIZE=true to resize the images to 320x180. Leave as false if images have
# already been resized using another tool.
#RESIZE=false
#if $RESIZE; then
#  RESIZE_HEIGHT=180
#  RESIZE_WIDTH=320
#else
#  RESIZE_HEIGHT=0
#  RESIZE_WIDTH=0
#fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=180 \
    --resize_width=320 \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/train.txt \
    $EXAMPLE/resnetcrowd_train_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=180 \
    --resize_width=320 \
    --shuffle \
    $VAL_DATA_ROOT \
    $DATA/val.txt \
    $EXAMPLE/resnetcrowd_val_lmdb

echo "Done."
