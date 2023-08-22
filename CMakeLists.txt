if("$ENV{ROS_VERSION}" STREQUAL "2")
	cmake_minimum_required(VERSION 3.8)
	set(DETECTED_ROS2 TRUE)
else()
	cmake_minimum_required(VERSION 3.1)
	set(DETECTED_ROS1 TRUE)
    set (CMAKE_CXX_STANDARD 14)
endif()
project(mrpt_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

if(DETECTED_ROS1)
    find_package(catkin REQUIRED COMPONENTS
        geometry_msgs
        message_generation
        sensor_msgs
        std_msgs
        )

    # list must be hand-ordered to satisfy dependencies between .msg files:
    add_message_files(
        DIRECTORY
            msg-ros1
        FILES
        GraphSlamAgent.msg
        GenericObservation.msg
        GraphConstraint.msg
        GraphSlamStats.msg
        ObservationObject.msg
        ObservationRangeBeacon.msg
        ObservationRangeBearing.msg
        WaypointSequence.msg
    )
    add_message_files(
        DIRECTORY
            msg-common
        FILES
        GenericObject.msg
        GraphSlamAgents.msg
        NetworkOfPoses.msg
        NodeIDWithLaserScan.msg
        NodeIDWithPose.msg
        NodeIDWithPoseVec.msg
        SingleObjectObservation.msg
        SingleRangeBeaconObservation.msg
        SingleRangeBearingObservation.msg
        Waypoint.msg
    )

    add_service_files(
        DIRECTORY srv
        FILES
        GetCMGraph.srv
        )

    generate_messages(DEPENDENCIES
        geometry_msgs
        sensor_msgs
        std_msgs
        )

    catkin_package(CATKIN_DEPENDS
        geometry_msgs
        message_runtime
        sensor_msgs
        std_msgs
        )
endif()

if(DETECTED_ROS2)
    # find dependencies
    find_package(ament_cmake REQUIRED)
    find_package(rosidl_default_generators REQUIRED)
    find_package(std_msgs REQUIRED)
    find_package(geometry_msgs REQUIRED)
    find_package(sensor_msgs REQUIRED)

    rosidl_generate_interfaces(${PROJECT_NAME}
    # Messages:
    msg-ros2/GenericObservation.msg
    msg-ros2/GraphConstraint.msg
    msg-ros2/GraphSlamAgent.msg
    msg-ros2/GraphSlamStats.msg
    msg-ros2/ObservationObject.msg
    msg-ros2/ObservationRangeBeacon.msg
    msg-ros2/ObservationRangeBearing.msg
    msg-ros2/WaypointSequence.msg
    msg-common/GenericObject.msg
    msg-common/GraphSlamAgents.msg
    msg-common/NetworkOfPoses.msg
    msg-common/NodeIDWithLaserScan.msg
    msg-common/NodeIDWithPose.msg
    msg-common/NodeIDWithPoseVec.msg
    msg-common/SingleObjectObservation.msg
    msg-common/SingleRangeBeaconObservation.msg
    msg-common/SingleRangeBearingObservation.msg
    msg-common/Waypoint.msg
# Services:
    srv/GetCMGraph.srv
    # deps:
    DEPENDENCIES
        std_msgs
        geometry_msgs
        sensor_msgs
    ADD_LINTER_TESTS
    )

    ament_export_dependencies(rosidl_default_runtime)

    if(BUILD_TESTING)
      find_package(ament_cmake_xmllint REQUIRED)
      ament_xmllint()
    endif()

    ament_package()
endif()
