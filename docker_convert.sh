#!/bin/bash

TIME=2011_09_26
SEQUENCE=0001
INPUT=/path/to/kitti
OUTPUT=/path/to/output

# Ensure output directory exists
mkdir -p $OUTPUT

# Delete previous outputs
rm -rf $OUTPUT/kitti_*

# Example run command
docker run -t --rm --tty \
    -e LOCAL_USER_ID=$(id -u) \
    -e LOCAL_GROUP_ID=$(id -g) \
    -v $INPUT:/data \
    -v $OUTPUT:/output \
    kitti2bag:ros2-jazzy \
    bash -c "kitti2bag raw_synced /data -t ${TIME} -r ${SEQUENCE} -o /output"
