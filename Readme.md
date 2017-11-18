# NatNet 3 ROS driver
[![Build Status](https://travis-ci.org/mje-nz/natnet_ros.svg?branch=master)](https://travis-ci.org/mje-nz/natnet_ros)

This package contains a ROS driver for the NatNet protocol used by the NaturalPoint OptiTrack motion capture system.
It supports NatNet version 3.0 (the version used by Motive 2.0), which is a bit more efficient and adds more accurate timing.
The actual NatNet implemention is in [mje-nz/python_natnet](https://github.com/mje-nz/python_natnet), which is included as a submodule and repackaged.

Features:

* Doesn't crash all the time, unlike mocap_optitrack
* Runs at full camera framerate, unlike vrpn_client_ros
* All topics are timestamped with the camera mid-exposure time (give or take a few tenths of a millisecond)
* Publishes rigid bodies as `geometry_msgs/PoseStamped`
* Publishes markers that aren't in rigid bodies as `geometry_msgs/PointStamped`
* Publishes all markers together as `visualization_msgs/Marker` (`SPHERE_LIST`) for Rviz


## TODO

* Set rate for fake client
* Set appropriate timestamps for fake client
* Use model descriptions to set up topics
* Link python_natnet from natnet-sdk-mirror (and link back)
* Rename MocapFrame to FrameOfData
* Update LabelledMarker with "entity_id" and "member_id" now that SDK 3.0.1 actually decodes that
* Skip deserialising unlabelled markers now that SDK 3.0.1 deprecates them
* Add has_model, is_unlabelled, is_active_markers flags in LabelledMarker from SDK 3.0.1
* Make clock sync optional
* Use ROS logging properly
* Release python_natnet on PyPI
* Implement server auto-discovery
* Add tests for ROS node
* Implement server and integration test networking code
