#!/bin/bash
rosdep install -y --from-paths src --ignore-src
catkin_make
catkin_make install
source devel/setup.bash
catkin_make run_tests
catkin_test_results

