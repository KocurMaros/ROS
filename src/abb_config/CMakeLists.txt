cmake_minimum_required(VERSION 3.1.3)
project(abb_config)

find_package(catkin REQUIRED)

catkin_package()
find_package(catkin REQUIRED COMPONENTS
moveit_ros_planning_interface 
moveit_ros_move_group
)
install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  PATTERN "setup_assistant.launch" EXCLUDE)
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

add_executable(abb_config src/moveit_tutorial.cpp)

target_link_libraries(abb_config ${catkin_LIBRARIES} ${Boost_LIBRARIES})

install(TARGETS abb_config DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
include_directories(${THIS_PACKAGE_INCLUDE_DIRS})
