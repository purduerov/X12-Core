; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude controller_msg.msg.html

(cl:defclass <controller_msg> (roslisp-msg-protocol:ros-message)
  ((RX_axis
    :reader RX_axis
    :initarg :RX_axis
    :type cl:float
    :initform 0.0)
   (RY_axis
    :reader RY_axis
    :initarg :RY_axis
    :type cl:float
    :initform 0.0)
   (LX_axis
    :reader LX_axis
    :initarg :LX_axis
    :type cl:float
    :initform 0.0)
   (LY_axis
    :reader LY_axis
    :initarg :LY_axis
    :type cl:float
    :initform 0.0)
   (a
    :reader a
    :initarg :a
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0)
   (DPadX
    :reader DPadX
    :initarg :DPadX
    :type cl:fixnum
    :initform 0)
   (DPadY
    :reader DPadY
    :initarg :DPadY
    :type cl:fixnum
    :initform 0)
   (RB
    :reader RB
    :initarg :RB
    :type cl:fixnum
    :initform 0)
   (LB
    :reader LB
    :initarg :LB
    :type cl:fixnum
    :initform 0)
   (Rtrigger
    :reader Rtrigger
    :initarg :Rtrigger
    :type cl:float
    :initform 0.0)
   (Ltrigger
    :reader Ltrigger
    :initarg :Ltrigger
    :type cl:float
    :initform 0.0))
)

(cl:defclass controller_msg (<controller_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<controller_msg> is deprecated: use shared_msgs-msg:controller_msg instead.")))

(cl:ensure-generic-function 'RX_axis-val :lambda-list '(m))
(cl:defmethod RX_axis-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:RX_axis-val is deprecated.  Use shared_msgs-msg:RX_axis instead.")
  (RX_axis m))

(cl:ensure-generic-function 'RY_axis-val :lambda-list '(m))
(cl:defmethod RY_axis-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:RY_axis-val is deprecated.  Use shared_msgs-msg:RY_axis instead.")
  (RY_axis m))

(cl:ensure-generic-function 'LX_axis-val :lambda-list '(m))
(cl:defmethod LX_axis-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:LX_axis-val is deprecated.  Use shared_msgs-msg:LX_axis instead.")
  (LX_axis m))

(cl:ensure-generic-function 'LY_axis-val :lambda-list '(m))
(cl:defmethod LY_axis-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:LY_axis-val is deprecated.  Use shared_msgs-msg:LY_axis instead.")
  (LY_axis m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:a-val is deprecated.  Use shared_msgs-msg:a instead.")
  (a m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:b-val is deprecated.  Use shared_msgs-msg:b instead.")
  (b m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:x-val is deprecated.  Use shared_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:y-val is deprecated.  Use shared_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'DPadX-val :lambda-list '(m))
(cl:defmethod DPadX-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:DPadX-val is deprecated.  Use shared_msgs-msg:DPadX instead.")
  (DPadX m))

(cl:ensure-generic-function 'DPadY-val :lambda-list '(m))
(cl:defmethod DPadY-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:DPadY-val is deprecated.  Use shared_msgs-msg:DPadY instead.")
  (DPadY m))

(cl:ensure-generic-function 'RB-val :lambda-list '(m))
(cl:defmethod RB-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:RB-val is deprecated.  Use shared_msgs-msg:RB instead.")
  (RB m))

(cl:ensure-generic-function 'LB-val :lambda-list '(m))
(cl:defmethod LB-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:LB-val is deprecated.  Use shared_msgs-msg:LB instead.")
  (LB m))

(cl:ensure-generic-function 'Rtrigger-val :lambda-list '(m))
(cl:defmethod Rtrigger-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:Rtrigger-val is deprecated.  Use shared_msgs-msg:Rtrigger instead.")
  (Rtrigger m))

(cl:ensure-generic-function 'Ltrigger-val :lambda-list '(m))
(cl:defmethod Ltrigger-val ((m <controller_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:Ltrigger-val is deprecated.  Use shared_msgs-msg:Ltrigger instead.")
  (Ltrigger m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller_msg>) ostream)
  "Serializes a message object of type '<controller_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'RX_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'RY_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'LX_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'LY_axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'b)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'DPadX)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'DPadY)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'RB)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'LB)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Rtrigger))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ltrigger))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller_msg>) istream)
  "Deserializes a message object of type '<controller_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'RX_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'RY_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'LX_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'LY_axis) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'b) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'DPadX) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'DPadY) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'RB) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'LB) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Rtrigger) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ltrigger) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller_msg>)))
  "Returns string type for a message object of type '<controller_msg>"
  "shared_msgs/controller_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller_msg)))
  "Returns string type for a message object of type 'controller_msg"
  "shared_msgs/controller_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller_msg>)))
  "Returns md5sum for a message object of type '<controller_msg>"
  "57ec734b5ac6013c2716cfd2d22db9b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller_msg)))
  "Returns md5sum for a message object of type 'controller_msg"
  "57ec734b5ac6013c2716cfd2d22db9b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller_msg>)))
  "Returns full string definition for message of type '<controller_msg>"
  (cl:format cl:nil "float32 RX_axis~%float32 RY_axis~%float32 LX_axis~%float32 LY_axis~%int8 a~%int8 b~%int8 x~%int8 y~%int8 DPadX~%int8 DPadY~%int8 RB~%int8 LB~%float32 Rtrigger~%float32 Ltrigger~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller_msg)))
  "Returns full string definition for message of type 'controller_msg"
  (cl:format cl:nil "float32 RX_axis~%float32 RY_axis~%float32 LX_axis~%float32 LY_axis~%int8 a~%int8 b~%int8 x~%int8 y~%int8 DPadX~%int8 DPadY~%int8 RB~%int8 LB~%float32 Rtrigger~%float32 Ltrigger~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller_msg>))
  (cl:+ 0
     4
     4
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'controller_msg
    (cl:cons ':RX_axis (RX_axis msg))
    (cl:cons ':RY_axis (RY_axis msg))
    (cl:cons ':LX_axis (LX_axis msg))
    (cl:cons ':LY_axis (LY_axis msg))
    (cl:cons ':a (a msg))
    (cl:cons ':b (b msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':DPadX (DPadX msg))
    (cl:cons ':DPadY (DPadY msg))
    (cl:cons ':RB (RB msg))
    (cl:cons ':LB (LB msg))
    (cl:cons ':Rtrigger (Rtrigger msg))
    (cl:cons ':Ltrigger (Ltrigger msg))
))
