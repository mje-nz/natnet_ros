#!/bin/bash
# Build natnet_ros and run tests
# Expects to be execute from a catkin workspace containing natnet_ros

source src/natnet_ros/ci_util.sh

travis_run apt-get update
travis_run apt-get install -y python-catkin-tools python-coverage

rosdep install -y --from-paths src --ignore-src
travis_run catkin config --install
travis_run catkin build --no-status --summarize
source install/setup.bash

travis_run catkin build --catkin-make-args run_tests -- --no-status --summarize
catkin_test_results --verbose
cp ~/.ros/.coverage out/
cd out
travis_run python -m coverage report
travis_run python -m coverage xml -i

travis_run bash <(curl -s https://codecov.io/bash)
