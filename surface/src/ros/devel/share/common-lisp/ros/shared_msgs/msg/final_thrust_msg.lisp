; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude final_thrust_msg.msg.html

(cl:defclass <final_thrust_msg> (roslisp-msg-protocol:ros-message)
  ((hfl
    :reader hfl
    :initarg :hfl
    :type cl:fixnum
    :initform 0)
   (hfr
    :reader hfr
    :initarg :hfr
    :type cl:fixnum
    :initform 0)
   (hbr
    :reader hbr
    :initarg :hbr
    :type cl:fixnum
    :initform 0)
   (hbl
    :reader hbl
    :initarg :hbl
    :type cl:fixnum
    :initform 0)
   (vfl
    :reader vfl
    :initarg :vfl
    :type cl:fixnum
    :initform 0)
   (vfr
    :reader vfr
    :initarg :vfr
    :type cl:fixnum
    :initform 0)
   (vbr
    :reader vbr
    :initarg :vbr
    :type cl:fixnum
    :initform 0)
   (vbl
    :reader vbl
    :initarg :vbl
    :type cl:fixnum
    :initform 0))
)

(cl:defclass final_thrust_msg (<final_thrust_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <final_thrust_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'final_thrust_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<final_thrust_msg> is deprecated: use shared_msgs-msg:final_thrust_msg instead.")))

(cl:ensure-generic-function 'hfl-val :lambda-list '(m))
(cl:defmethod hfl-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:hfl-val is deprecated.  Use shared_msgs-msg:hfl instead.")
  (hfl m))

(cl:ensure-generic-function 'hfr-val :lambda-list '(m))
(cl:defmethod hfr-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:hfr-val is deprecated.  Use shared_msgs-msg:hfr instead.")
  (hfr m))

(cl:ensure-generic-function 'hbr-val :lambda-list '(m))
(cl:defmethod hbr-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:hbr-val is deprecated.  Use shared_msgs-msg:hbr instead.")
  (hbr m))

(cl:ensure-generic-function 'hbl-val :lambda-list '(m))
(cl:defmethod hbl-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:hbl-val is deprecated.  Use shared_msgs-msg:hbl instead.")
  (hbl m))

(cl:ensure-generic-function 'vfl-val :lambda-list '(m))
(cl:defmethod vfl-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:vfl-val is deprecated.  Use shared_msgs-msg:vfl instead.")
  (vfl m))

(cl:ensure-generic-function 'vfr-val :lambda-list '(m))
(cl:defmethod vfr-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:vfr-val is deprecated.  Use shared_msgs-msg:vfr instead.")
  (vfr m))

(cl:ensure-generic-function 'vbr-val :lambda-list '(m))
(cl:defmethod vbr-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:vbr-val is deprecated.  Use shared_msgs-msg:vbr instead.")
  (vbr m))

(cl:ensure-generic-function 'vbl-val :lambda-list '(m))
(cl:defmethod vbl-val ((m <final_thrust_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:vbl-val is deprecated.  Use shared_msgs-msg:vbl instead.")
  (vbl m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <final_thrust_msg>) ostream)
  "Serializes a message object of type '<final_thrust_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hfl)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hfr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hbr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hbl)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vfl)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vfr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vbr)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vbl)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <final_thrust_msg>) istream)
  "Deserializes a message object of type '<final_thrust_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hfl)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hfr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hbr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hbl)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vfl)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vfr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vbr)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vbl)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<final_thrust_msg>)))
  "Returns string type for a message object of type '<final_thrust_msg>"
  "shared_msgs/final_thrust_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'final_thrust_msg)))
  "Returns string type for a message object of type 'final_thrust_msg"
  "shared_msgs/final_thrust_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<final_thrust_msg>)))
  "Returns md5sum for a message object of type '<final_thrust_msg>"
  "6ec19b411594e3b47b780fbf91db2d37")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'final_thrust_msg)))
  "Returns md5sum for a message object of type 'final_thrust_msg"
  "6ec19b411594e3b47b780fbf91db2d37")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<final_thrust_msg>)))
  "Returns full string definition for message of type '<final_thrust_msg>"
  (cl:format cl:nil "uint8 hfl~%uint8 hfr~%uint8 hbr~%uint8 hbl~%uint8 vfl~%uint8 vfr~%uint8 vbr~%uint8 vbl~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'final_thrust_msg)))
  "Returns full string definition for message of type 'final_thrust_msg"
  (cl:format cl:nil "uint8 hfl~%uint8 hfr~%uint8 hbr~%uint8 hbl~%uint8 vfl~%uint8 vfr~%uint8 vbr~%uint8 vbl~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <final_thrust_msg>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <final_thrust_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'final_thrust_msg
    (cl:cons ':hfl (hfl msg))
    (cl:cons ':hfr (hfr msg))
    (cl:cons ':hbr (hbr msg))
    (cl:cons ':hbl (hbl msg))
    (cl:cons ':vfl (vfl msg))
    (cl:cons ':vfr (vfr msg))
    (cl:cons ':vbr (vbr msg))
    (cl:cons ':vbl (vbl msg))
))
