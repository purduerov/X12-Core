; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude esc_single_msg.msg.html

(cl:defclass <esc_single_msg> (roslisp-msg-protocol:ros-message)
  ((current
    :reader current
    :initarg :current
    :type cl:float
    :initform 0.0)
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass esc_single_msg (<esc_single_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <esc_single_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'esc_single_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<esc_single_msg> is deprecated: use shared_msgs-msg:esc_single_msg instead.")))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <esc_single_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:current-val is deprecated.  Use shared_msgs-msg:current instead.")
  (current m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <esc_single_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:temperature-val is deprecated.  Use shared_msgs-msg:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <esc_single_msg>) ostream)
  "Serializes a message object of type '<esc_single_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <esc_single_msg>) istream)
  "Deserializes a message object of type '<esc_single_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<esc_single_msg>)))
  "Returns string type for a message object of type '<esc_single_msg>"
  "shared_msgs/esc_single_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'esc_single_msg)))
  "Returns string type for a message object of type 'esc_single_msg"
  "shared_msgs/esc_single_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<esc_single_msg>)))
  "Returns md5sum for a message object of type '<esc_single_msg>"
  "bcd9c34c6b5710978aab3ba057678b88")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'esc_single_msg)))
  "Returns md5sum for a message object of type 'esc_single_msg"
  "bcd9c34c6b5710978aab3ba057678b88")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<esc_single_msg>)))
  "Returns full string definition for message of type '<esc_single_msg>"
  (cl:format cl:nil "float32 current~%float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'esc_single_msg)))
  "Returns full string definition for message of type 'esc_single_msg"
  (cl:format cl:nil "float32 current~%float32 temperature~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <esc_single_msg>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <esc_single_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'esc_single_msg
    (cl:cons ':current (current msg))
    (cl:cons ':temperature (temperature msg))
))
