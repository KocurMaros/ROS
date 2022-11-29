cmake_minimum_required(VERSION 3.1.3)
project(abb_config)
add_compile_options(-std=c++11)


find_package(Eigen3 REQUIRED)
find_package(catkin REQUIRED 
  COMPONENTS
    moveit_ros_planning_interface 
    moveit_ros_move_group
    interactive_markers
    moveit_core
    moveit_visual_tools
    moveit_ros_planning
    pluginlib
    geometric_shapes
    pcl_ros
    pcl_conversions
    rosbag
    tf2_ros
    tf2_eigen
    tf2_geometry_msgs
)

catkin_package(
  LIBRARIES
    interactivity_utils
  INCLUDE_DIRS
    ${THIS_PACKAGE_INCLUDE_DIRS}
  CATKIN_DEPENDS
    moveit_core
    moveit_visual_tools
    moveit_ros_planning_interface
    interactive_markers
  DEPENDS
    EIGEN3
)


###########
## BUILD ##
###########

include_directories(SYSTEM ${THIS_PACKAGE_INCLUDE_DIRS} ${Boost_INCLUDE_DIR} ${EIGEN3_INCLUDE_DIRS})
include_directories(${catkin_INCLUDE_DIRS})
link_directories(${catkin_LIBRARY_DIRS})





add_executable(abb_config src/moveit_tutorial.cpp)
target_link_libraries(abb_config ${catkin_LIBRARIES} ${Boost_LIBRARIES})
include_directories(${THIS_PACKAGE_INCLUDE_DIRS})

install(TARGETS abb_config DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  PATTERN "setup_assistant.launch" EXCLUDE)
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
