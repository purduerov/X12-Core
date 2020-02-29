; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude tools_command_msg.msg.html

(cl:defclass <tools_command_msg> (roslisp-msg-protocol:ros-message)
  ((manipulator
    :reader manipulator
    :initarg :manipulator
    :type cl:fixnum
    :initform 0)
   (groutTrout
    :reader groutTrout
    :initarg :groutTrout
    :type cl:fixnum
    :initform 0)
   (liftBag
    :reader liftBag
    :initarg :liftBag
    :type cl:fixnum
    :initform 0)
   (marker
    :reader marker
    :initarg :marker
    :type cl:fixnum
    :initform 0))
)

(cl:defclass tools_command_msg (<tools_command_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <tools_command_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'tools_command_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<tools_command_msg> is deprecated: use shared_msgs-msg:tools_command_msg instead.")))

(cl:ensure-generic-function 'manipulator-val :lambda-list '(m))
(cl:defmethod manipulator-val ((m <tools_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:manipulator-val is deprecated.  Use shared_msgs-msg:manipulator instead.")
  (manipulator m))

(cl:ensure-generic-function 'groutTrout-val :lambda-list '(m))
(cl:defmethod groutTrout-val ((m <tools_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:groutTrout-val is deprecated.  Use shared_msgs-msg:groutTrout instead.")
  (groutTrout m))

(cl:ensure-generic-function 'liftBag-val :lambda-list '(m))
(cl:defmethod liftBag-val ((m <tools_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:liftBag-val is deprecated.  Use shared_msgs-msg:liftBag instead.")
  (liftBag m))

(cl:ensure-generic-function 'marker-val :lambda-list '(m))
(cl:defmethod marker-val ((m <tools_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:marker-val is deprecated.  Use shared_msgs-msg:marker instead.")
  (marker m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <tools_command_msg>) ostream)
  "Serializes a message object of type '<tools_command_msg>"
  (cl:let* ((signed (cl:slot-value msg 'manipulator)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'groutTrout)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'liftBag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'marker)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <tools_command_msg>) istream)
  "Deserializes a message object of type '<tools_command_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'manipulator) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'groutTrout) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'liftBag) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'marker) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<tools_command_msg>)))
  "Returns string type for a message object of type '<tools_command_msg>"
  "shared_msgs/tools_command_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'tools_command_msg)))
  "Returns string type for a message object of type 'tools_command_msg"
  "shared_msgs/tools_command_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<tools_command_msg>)))
  "Returns md5sum for a message object of type '<tools_command_msg>"
  "99400b8a44513c5ef4f0bf7e444e5295")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'tools_command_msg)))
  "Returns md5sum for a message object of type 'tools_command_msg"
  "99400b8a44513c5ef4f0bf7e444e5295")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<tools_command_msg>)))
  "Returns full string definition for message of type '<tools_command_msg>"
  (cl:format cl:nil "int8 manipulator~%int8 groutTrout~%int8 liftBag~%int8 marker~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'tools_command_msg)))
  "Returns full string definition for message of type 'tools_command_msg"
  (cl:format cl:nil "int8 manipulator~%int8 groutTrout~%int8 liftBag~%int8 marker~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <tools_command_msg>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <tools_command_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'tools_command_msg
    (cl:cons ':manipulator (manipulator msg))
    (cl:cons ':groutTrout (groutTrout msg))
    (cl:cons ':liftBag (liftBag msg))
    (cl:cons ':marker (marker msg))
))
