#int32 INVALID_LANDMARK_ID = -1


float64  range              # Distance, in meters.
float64  yaw                # Angle wrt +Z (rads)
float64  pitch              # Angle wrt +Y (rads)
geometry_msgs/Pose pose_wo  #Pose in world space coordinates
geometry_msgs/Pose pose_so  #Pose in sensor space coordinates
float32[] shape_variables   #Shape variables describing the object
int32    id                 # Landmark ID (or INVALID_LANDMARK_ID if landmarks are not identified)

