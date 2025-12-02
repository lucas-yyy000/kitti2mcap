#!/bin/bash
# Useage: ./docker_run.sh <data directory> <output directory>

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DATA_DIR=${1:-$SCRIPT_DIR/data}
OUTPUT_DIR=${2:-$SCRIPT_DIR/output}
mkdir -p $OUTPUT_DIR

docker run -it -v $DATA_DIR:/data -v $OUTPUT_DIR:/output kitti2bag:ros2-jazzy bash
