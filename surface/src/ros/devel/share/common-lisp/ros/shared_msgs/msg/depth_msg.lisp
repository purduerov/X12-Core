; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude depth_msg.msg.html

(cl:defclass <depth_msg> (roslisp-msg-protocol:ros-message)
  ((pressure
    :reader pressure
    :initarg :pressure
    :type cl:float
    :initform 0.0))
)

(cl:defclass depth_msg (<depth_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <depth_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'depth_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<depth_msg> is deprecated: use shared_msgs-msg:depth_msg instead.")))

(cl:ensure-generic-function 'pressure-val :lambda-list '(m))
(cl:defmethod pressure-val ((m <depth_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:pressure-val is deprecated.  Use shared_msgs-msg:pressure instead.")
  (pressure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <depth_msg>) ostream)
  "Serializes a message object of type '<depth_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <depth_msg>) istream)
  "Deserializes a message object of type '<depth_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pressure) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<depth_msg>)))
  "Returns string type for a message object of type '<depth_msg>"
  "shared_msgs/depth_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'depth_msg)))
  "Returns string type for a message object of type 'depth_msg"
  "shared_msgs/depth_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<depth_msg>)))
  "Returns md5sum for a message object of type '<depth_msg>"
  "d08eeab8c09d2ba14f8144e3bbf40d21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'depth_msg)))
  "Returns md5sum for a message object of type 'depth_msg"
  "d08eeab8c09d2ba14f8144e3bbf40d21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<depth_msg>)))
  "Returns full string definition for message of type '<depth_msg>"
  (cl:format cl:nil "float32 pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'depth_msg)))
  "Returns full string definition for message of type 'depth_msg"
  (cl:format cl:nil "float32 pressure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <depth_msg>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <depth_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'depth_msg
    (cl:cons ':pressure (pressure msg))
))
