# Run instructions for ROS2

Here are the instructions how to run kitti2bag in ROS2 docker container. These are examples so please adopt the bash scripts according to your need.

## Download KITTI Odometry dataset
Make sure to download the odometry dataset to ```data/```, the folder structure should looks like:
```
data/
 |- poses/
 |  |- 00.txt 
 |  |- ...
 |- sequences/
    | - 00/
    | - ...
```


## Build docker image

To build the ROS2 Jazzy docker environment, run the following.

```bash
./docker_build.sh
```


## Example of attaching to the existing container

```bash
./docker_attach.sh
```


## KITTI Odom Sequence 00 Example

### Convert kitti to mcap
Inside the docker container, do
```bash
kitti2bag odom_color /data -s 00 -o /output
```


### Print info about the converted mcap

```bash
ros2 bag info kitti_data_odometry_color_sequence_00
```

#### Example stdout
```
Files:             kitti_data_odometry_color_sequence_00_0.mcap
Bag size:          20.1 GiB
Storage id:        mcap
ROS Distro:        jazzy
Duration:          470.581599950s
Start:             Nov 18 2025 20:32:48.445616961 (1763497968.445616961)
End:               Nov 18 2025 20:40:39.027216911 (1763498439.027216911)
Messages:          31788
Topic information: Topic: /kitti/camera_color_left/camera_info | Type: sensor_msgs/msg/CameraInfo | Count: 4541 | Serialization Format: cdr
                   Topic: /kitti/camera_color_left/image_rect | Type: sensor_msgs/msg/Image | Count: 4541 | Serialization Format: cdr
                   Topic: /kitti/camera_color_right/camera_info | Type: sensor_msgs/msg/CameraInfo | Count: 4541 | Serialization Format: cdr
                   Topic: /kitti/camera_color_right/image_rect | Type: sensor_msgs/msg/Image | Count: 4541 | Serialization Format: cdr
                   Topic: /kitti/odom | Type: nav_msgs/msg/Odometry | Count: 4541 | Serialization Format: cdr
                   Topic: /kitti/velo/pointcloud | Type: sensor_msgs/msg/PointCloud2 | Count: 4541 | Serialization Format: cdr
                   Topic: /tf | Type: tf2_msgs/msg/TFMessage | Count: 4541 | Serialization Format: cdr
                   Topic: /tf_static | Type: tf2_msgs/msg/TFMessage | Count: 1 | Serialization Format: cdr
Service:           0
Service information: 
```

## Test the converted bag file

### Play the mcap file
Inside the container:
```bash
ros2 bag play /output/kitti_data_odometry_color_sequence_00
```

You may need to do
```bash
ros2 bag play /output/kitti_data_odometry_color_sequence_00 --qos-profile-overrides-path /output/qos_override.yaml
```
if there is policy incompatibility.