# Install script for directory: /home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/shared_msgs/msg" TYPE FILE FILES
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/esc_single_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/auto_control_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/auto_command_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/pressure_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/thrust_command_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/final_thrust_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/can_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/i2c_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/imu_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/depth_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/temp_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/thrust_status_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/tools_command_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/controller_msg.msg"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/msg/thrust_disable_inverted_msg.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/shared_msgs/cmake" TYPE FILE FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/build/shared_msgs/catkin_generated/installspace/shared_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/include/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/share/roseus/ros/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/share/common-lisp/ros/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/share/gennodejs/ros/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/lib/python2.7/dist-packages/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/devel/lib/python2.7/dist-packages/shared_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/build/shared_msgs/catkin_generated/installspace/shared_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/shared_msgs/cmake" TYPE FILE FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/build/shared_msgs/catkin_generated/installspace/shared_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/shared_msgs/cmake" TYPE FILE FILES
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/build/shared_msgs/catkin_generated/installspace/shared_msgsConfig.cmake"
    "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/build/shared_msgs/catkin_generated/installspace/shared_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/shared_msgs" TYPE FILE FILES "/home/eric/Desktop/ROV/X12-Core/surface/src/ros/src/shared_msgs/package.xml")
endif()

