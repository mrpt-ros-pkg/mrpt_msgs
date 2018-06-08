cmake_minimum_required(VERSION 3.1)
set (CMAKE_CXX_STANDARD 14)
project(mrpt_msgs)

find_package(catkin REQUIRED COMPONENTS
    geometry_msgs
    message_generation
    sensor_msgs
    std_msgs
    )

add_message_files(
  DIRECTORY msg
  FILES
  GraphConstraint.msg
  GraphSlamAgent.msg
  GraphSlamAgents.msg
  GraphSlamStats.msg
  NetworkOfPoses.msg
  NodeIDWithLaserScan.msg
  NodeIDWithPose_vec.msg
  NodeIDWithPose.msg
  ObservationRangeBeacon.msg
  ObservationRangeBearing.msg
  SingleRangeBeaconObservation.msg
  SingleRangeBearingObservation.msg
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
