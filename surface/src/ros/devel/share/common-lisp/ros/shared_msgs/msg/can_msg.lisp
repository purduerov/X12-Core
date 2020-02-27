; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude can_msg.msg.html

(cl:defclass <can_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0))
)

(cl:defclass can_msg (<can_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <can_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'can_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<can_msg> is deprecated: use shared_msgs-msg:can_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <can_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:id-val is deprecated.  Use shared_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <can_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:data-val is deprecated.  Use shared_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <can_msg>) ostream)
  "Serializes a message object of type '<can_msg>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <can_msg>) istream)
  "Deserializes a message object of type '<can_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<can_msg>)))
  "Returns string type for a message object of type '<can_msg>"
  "shared_msgs/can_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'can_msg)))
  "Returns string type for a message object of type 'can_msg"
  "shared_msgs/can_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<can_msg>)))
  "Returns md5sum for a message object of type '<can_msg>"
  "a99dfaa57c52989d3a8a604914c1720d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'can_msg)))
  "Returns md5sum for a message object of type 'can_msg"
  "a99dfaa57c52989d3a8a604914c1720d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<can_msg>)))
  "Returns full string definition for message of type '<can_msg>"
  (cl:format cl:nil "int32 id~%uint64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'can_msg)))
  "Returns full string definition for message of type 'can_msg"
  (cl:format cl:nil "int32 id~%uint64 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <can_msg>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <can_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'can_msg
    (cl:cons ':id (id msg))
    (cl:cons ':data (data msg))
))
