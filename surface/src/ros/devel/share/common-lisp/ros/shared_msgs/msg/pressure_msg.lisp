; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude pressure_msg.msg.html

(cl:defclass <pressure_msg> (roslisp-msg-protocol:ros-message)
  ((pressure
    :reader pressure
    :initarg :pressure
    :type cl:float
    :initform 0.0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass pressure_msg (<pressure_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pressure_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pressure_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<pressure_msg> is deprecated: use shared_msgs-msg:pressure_msg instead.")))

(cl:ensure-generic-function 'pressure-val :lambda-list '(m))
(cl:defmethod pressure-val ((m <pressure_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:pressure-val is deprecated.  Use shared_msgs-msg:pressure instead.")
  (pressure m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <pressure_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:temperature-val is deprecated.  Use shared_msgs-msg:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pressure_msg>) ostream)
  "Serializes a message object of type '<pressure_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pressure_msg>) istream)
  "Deserializes a message object of type '<pressure_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pressure_msg>)))
  "Returns string type for a message object of type '<pressure_msg>"
  "shared_msgs/pressure_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pressure_msg)))
  "Returns string type for a message object of type 'pressure_msg"
  "shared_msgs/pressure_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pressure_msg>)))
  "Returns md5sum for a message object of type '<pressure_msg>"
  "62167d413640523c7acac52cadc6c243")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pressure_msg)))
  "Returns md5sum for a message object of type 'pressure_msg"
  "62167d413640523c7acac52cadc6c243")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pressure_msg>)))
  "Returns full string definition for message of type '<pressure_msg>"
  (cl:format cl:nil "float32 pressure~%float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pressure_msg)))
  "Returns full string definition for message of type 'pressure_msg"
  (cl:format cl:nil "float32 pressure~%float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pressure_msg>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pressure_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'pressure_msg
    (cl:cons ':pressure (pressure msg))
    (cl:cons ':temperature (temperature msg))
))
