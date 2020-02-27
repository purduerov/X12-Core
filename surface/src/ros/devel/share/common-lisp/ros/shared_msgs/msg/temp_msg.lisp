; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude temp_msg.msg.html

(cl:defclass <temp_msg> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass temp_msg (<temp_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temp_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temp_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<temp_msg> is deprecated: use shared_msgs-msg:temp_msg instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <temp_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:temperature-val is deprecated.  Use shared_msgs-msg:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temp_msg>) ostream)
  "Serializes a message object of type '<temp_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temp_msg>) istream)
  "Deserializes a message object of type '<temp_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temp_msg>)))
  "Returns string type for a message object of type '<temp_msg>"
  "shared_msgs/temp_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp_msg)))
  "Returns string type for a message object of type 'temp_msg"
  "shared_msgs/temp_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temp_msg>)))
  "Returns md5sum for a message object of type '<temp_msg>"
  "694ab1a51fd38693b5cadd94c1ae252d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temp_msg)))
  "Returns md5sum for a message object of type 'temp_msg"
  "694ab1a51fd38693b5cadd94c1ae252d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temp_msg>)))
  "Returns full string definition for message of type '<temp_msg>"
  (cl:format cl:nil "float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temp_msg)))
  "Returns full string definition for message of type 'temp_msg"
  (cl:format cl:nil "float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temp_msg>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temp_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'temp_msg
    (cl:cons ':temperature (temperature msg))
))
