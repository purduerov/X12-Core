; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude i2c_msg.msg.html

(cl:defclass <i2c_msg> (roslisp-msg-protocol:ros-message)
  ((addr
    :reader addr
    :initarg :addr
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass i2c_msg (<i2c_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <i2c_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'i2c_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<i2c_msg> is deprecated: use shared_msgs-msg:i2c_msg instead.")))

(cl:ensure-generic-function 'addr-val :lambda-list '(m))
(cl:defmethod addr-val ((m <i2c_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:addr-val is deprecated.  Use shared_msgs-msg:addr instead.")
  (addr m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <i2c_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:data-val is deprecated.  Use shared_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <i2c_msg>) ostream)
  "Serializes a message object of type '<i2c_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'addr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <i2c_msg>) istream)
  "Deserializes a message object of type '<i2c_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'addr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<i2c_msg>)))
  "Returns string type for a message object of type '<i2c_msg>"
  "shared_msgs/i2c_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'i2c_msg)))
  "Returns string type for a message object of type 'i2c_msg"
  "shared_msgs/i2c_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<i2c_msg>)))
  "Returns md5sum for a message object of type '<i2c_msg>"
  "b186db14e4c5189ed032baff6e0239ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'i2c_msg)))
  "Returns md5sum for a message object of type 'i2c_msg"
  "b186db14e4c5189ed032baff6e0239ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<i2c_msg>)))
  "Returns full string definition for message of type '<i2c_msg>"
  (cl:format cl:nil "uint8 addr~%uint64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'i2c_msg)))
  "Returns full string definition for message of type 'i2c_msg"
  (cl:format cl:nil "uint8 addr~%uint64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <i2c_msg>))
  (cl:+ 0
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <i2c_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'i2c_msg
    (cl:cons ':addr (addr msg))
    (cl:cons ':data (data msg))
))
