cmake_minimum_required(VERSION 2.8.3)
project(natnet_ros)

find_package(catkin REQUIRED COMPONENTS rospy python_natnet)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

catkin_package(CATKIN_DEPENDS rospy natnet_msgs)

catkin_install_python(PROGRAMS scripts/client DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

if(CATKIN_ENABLE_TESTING)
  find_package(rostest REQUIRED)
  add_rostest(test/client.test)
endif()
