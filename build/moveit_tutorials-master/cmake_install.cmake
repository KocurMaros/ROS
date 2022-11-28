# Install script for directory: /home/rrm/ROS/src/moveit_tutorials-master

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/rrm/ROS/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/rrm/ROS/build/moveit_tutorials-master/catkin_generated/installspace/moveit_tutorials.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_tutorials/cmake" TYPE FILE FILES
    "/home/rrm/ROS/build/moveit_tutorials-master/catkin_generated/installspace/moveit_tutorialsConfig.cmake"
    "/home/rrm/ROS/build/moveit_tutorials-master/catkin_generated/installspace/moveit_tutorialsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/moveit_tutorials" TYPE FILE FILES "/home/rrm/ROS/src/moveit_tutorials-master/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/controller_configuration/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/hand_eye_calibration/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/interactivity/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/kinematics/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/motion_planning_api/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/motion_planning_pipeline/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/move_group_interface/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/move_group_python_interface/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/perception_pipeline/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/pick_place/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/planning/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/planning_scene/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/planning_scene_ros_api/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/robot_model_and_robot_state/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/state_display/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/subframes/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/tests/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/trajopt_planner/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/creating_moveit_plugins/lerp_motion_planner/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/moveit_cpp/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/collision_environments/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/visualizing_collisions/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/bullet_collision_checker/cmake_install.cmake")
  include("/home/rrm/ROS/build/moveit_tutorials-master/doc/mesh_filter/cmake_install.cmake")

endif()

