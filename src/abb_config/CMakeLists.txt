cmake_minimum_required(VERSION 3.1.3)
project(abb_config)

find_package(catkin REQUIRED)

catkin_package()

install(DIRECTORY launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  PATTERN "setup_assistant.launch" EXCLUDE)
install(DIRECTORY config DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

add_executable(moveit_tutorial src/moveit_tutorial.cpp)

target_link_libraries(moveit_tutorial ${catkin_LIBRARIES} ${Boost_LIBRARIES})

install(TARGETS moveit_tutorial DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
include_directories(${THIS_PACKAGE_INCLUDE_DIRS})
