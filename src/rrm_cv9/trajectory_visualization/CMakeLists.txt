cmake_minimum_required(VERSION 3.0.2)
project(trajectory_visualization)

find_package(catkin REQUIRED COMPONENTS
        roscpp
#        moveit_core
        eigen_conversions
        moveit_ros_planning_interface
        )

find_package(Eigen3 REQUIRED)

catkin_package()

include_directories(
 include
  ${catkin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIRS}
)


add_executable(trajectory_visualization src/trajectory_visualization.cpp)
add_executable(trajectory_visualization_samesrc src/trajectory_visualization_part2.cpp)

add_dependencies(trajectory_visualization ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(trajectory_visualization
        ${catkin_LIBRARIES}
        )