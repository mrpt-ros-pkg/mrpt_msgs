geometry_msgs/Pose target  # target pose in map frame. Heading may be ignored
bool ignore_heading
bool allow_skip
float64 allowed_distance   # minimum distance (meters) to consider the target reached
# [0,1] relative speed at this target. 0=means use slow down
# so the robot approaches the goal slowly:
float64 speed_ratio