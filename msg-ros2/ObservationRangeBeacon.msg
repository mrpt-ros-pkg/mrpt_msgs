# An observation of one or more landmarks detected by their range from
# a sensor on the robot.

# Time of sensor data acquisition, coordinate frame ID.
std_msgs/Header header

# The sensor pose on the robot coordinates frame.
geometry_msgs/Pose sensor_pose_on_robot

# Sensor characteristics:
float64 min_sensor_distance   # In meters (m)
float64 max_sensor_distance   # (m)

# Typical sensor noise:
float64 sensor_std_range      # (m)

# The vector of individual observations
SingleRangeBeaconObservation[] sensed_data


