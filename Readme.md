# NatNet 3 ROS driver
[![Build Status](https://travis-ci.org/mje-nz/natnet_ros.svg?branch=master)](https://travis-ci.org/mje-nz/natnet_ros)

This package contains a ROS driver for the NatNet protocol used by the NaturalPoint OptiTrack motion capture system.
It supports NatNet version 3.0 (the version used by Motive 2.0), which is a bit more efficient and adds more accurate timing.
The actual NatNet implementation is in [mje-nz/python_natnet](https://github.com/mje-nz/python_natnet), which is included as a submodule and repackaged.

Features:

* Doesn't crash all the time, unlike mocap_optitrack
* Synchronize clocks to get timestamps right, unlike vrpn_client_ros
* All topics are timestamped with the camera mid-exposure time (give or take a few tenths of a millisecond)
* Publishes rigid bodies as `geometry_msgs/PoseStamped`
* Publishes markers as `geometry_msgs/PointStamped`
* Publishes markers that aren't in a rigid body as `natnet_msgs/MarkerList`, because they change ID a lot
* Publishes all markers together as `visualization_msgs/Marker` (`SPHERE_LIST`) for Rviz


## TODO

* Add duplicate marker ID check and report bug
* Figure out why "solver replaces occlusion" isn't working
* Rename MocapFrame to FrameOfData
* Make clock sync optional
* Release python_natnet on PyPI
