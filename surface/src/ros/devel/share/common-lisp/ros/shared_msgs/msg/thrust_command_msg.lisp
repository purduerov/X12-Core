; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude thrust_command_msg.msg.html

(cl:defclass <thrust_command_msg> (roslisp-msg-protocol:ros-message)
  ((desired_thrust
    :reader desired_thrust
    :initarg :desired_thrust
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass thrust_command_msg (<thrust_command_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <thrust_command_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'thrust_command_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<thrust_command_msg> is deprecated: use shared_msgs-msg:thrust_command_msg instead.")))

(cl:ensure-generic-function 'desired_thrust-val :lambda-list '(m))
(cl:defmethod desired_thrust-val ((m <thrust_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:desired_thrust-val is deprecated.  Use shared_msgs-msg:desired_thrust instead.")
  (desired_thrust m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <thrust_command_msg>) ostream)
  "Serializes a message object of type '<thrust_command_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'desired_thrust))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <thrust_command_msg>) istream)
  "Deserializes a message object of type '<thrust_command_msg>"
  (cl:setf (cl:slot-value msg 'desired_thrust) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'desired_thrust)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<thrust_command_msg>)))
  "Returns string type for a message object of type '<thrust_command_msg>"
  "shared_msgs/thrust_command_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'thrust_command_msg)))
  "Returns string type for a message object of type 'thrust_command_msg"
  "shared_msgs/thrust_command_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<thrust_command_msg>)))
  "Returns md5sum for a message object of type '<thrust_command_msg>"
  "799334c773133ce868f5247076316205")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'thrust_command_msg)))
  "Returns md5sum for a message object of type 'thrust_command_msg"
  "799334c773133ce868f5247076316205")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<thrust_command_msg>)))
  "Returns full string definition for message of type '<thrust_command_msg>"
  (cl:format cl:nil "float32[6] desired_thrust~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'thrust_command_msg)))
  "Returns full string definition for message of type 'thrust_command_msg"
  (cl:format cl:nil "float32[6] desired_thrust~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <thrust_command_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'desired_thrust) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <thrust_command_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'thrust_command_msg
    (cl:cons ':desired_thrust (desired_thrust msg))
))
