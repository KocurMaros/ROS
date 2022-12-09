# Install script for directory: /home/rrm/ROS/src

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
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE PROGRAM FILES "/home/rrm/ROS/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE PROGRAM FILES "/home/rrm/ROS/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/setup.bash;/home/rrm/ROS/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE FILE FILES
    "/home/rrm/ROS/build/catkin_generated/installspace/setup.bash"
    "/home/rrm/ROS/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/setup.sh;/home/rrm/ROS/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE FILE FILES
    "/home/rrm/ROS/build/catkin_generated/installspace/setup.sh"
    "/home/rrm/ROS/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/setup.zsh;/home/rrm/ROS/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE FILE FILES
    "/home/rrm/ROS/build/catkin_generated/installspace/setup.zsh"
    "/home/rrm/ROS/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rrm/ROS/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rrm/ROS/install" TYPE FILE FILES "/home/rrm/ROS/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rrm/ROS/build/gtest/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_experimental/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1200_5_90_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1200_7_70_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1200_gazebo/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb120_gazebo/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb120_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb120t_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1600_6_12_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb2400_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb6640_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/robot/abb_moveit_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_resources/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/eigen_example/cmake_install.cmake")
  include("/home/rrm/ROS/build/meno_matky_za_slobodna/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_crb15000_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1200_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb120_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb1600_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb2400_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb2600_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb4400_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb4600_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb52_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb5400_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb6600_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb6640_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb6650s_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb6700_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_experimental/abb_irb7600_support/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/robot/abb_model/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv3_kocur/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb/abb_irb2400_moveit_plugins/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/robot/abb_irb4600_60_205_ikfast/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/ik_solver_example/cmake_install.cmake")
  include("/home/rrm/ROS/build/abb_config/cmake_install.cmake")
  include("/home/rrm/ROS/build/rrm_cv9/trajectory_visualization/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/rrm/ROS/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
