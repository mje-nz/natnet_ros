#!/bin/bash
source ci_util.sh

travis_run rosdep install -y --from-paths src --ignore-src
travis_run catkin config --install
travis_run catkin build --no-status --summarize
travis_run source install/setup.bash
travis_run catkin build --catkin-make-args run_tests -- --no-status --summarize
travis_run catkin_test_results --verbose
travis_run cp ~/.ros/.coverage out/
travis_run cd out && python -m coverage report && python -m coverage xml -i
