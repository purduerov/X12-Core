; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude auto_control_msg.msg.html

(cl:defclass <auto_control_msg> (roslisp-msg-protocol:ros-message)
  ((thrust_vec
    :reader thrust_vec
    :initarg :thrust_vec
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0))
   (dims_locked
    :reader dims_locked
    :initarg :dims_locked
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 6 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass auto_control_msg (<auto_control_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <auto_control_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'auto_control_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<auto_control_msg> is deprecated: use shared_msgs-msg:auto_control_msg instead.")))

(cl:ensure-generic-function 'thrust_vec-val :lambda-list '(m))
(cl:defmethod thrust_vec-val ((m <auto_control_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:thrust_vec-val is deprecated.  Use shared_msgs-msg:thrust_vec instead.")
  (thrust_vec m))

(cl:ensure-generic-function 'dims_locked-val :lambda-list '(m))
(cl:defmethod dims_locked-val ((m <auto_control_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:dims_locked-val is deprecated.  Use shared_msgs-msg:dims_locked instead.")
  (dims_locked m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <auto_control_msg>) ostream)
  "Serializes a message object of type '<auto_control_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'thrust_vec))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'dims_locked))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <auto_control_msg>) istream)
  "Deserializes a message object of type '<auto_control_msg>"
  (cl:setf (cl:slot-value msg 'thrust_vec) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'thrust_vec)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'dims_locked) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'dims_locked)))
    (cl:dotimes (i 6)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<auto_control_msg>)))
  "Returns string type for a message object of type '<auto_control_msg>"
  "shared_msgs/auto_control_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'auto_control_msg)))
  "Returns string type for a message object of type 'auto_control_msg"
  "shared_msgs/auto_control_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<auto_control_msg>)))
  "Returns md5sum for a message object of type '<auto_control_msg>"
  "563a60a06dd4f4297aa17e367a4fb89b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'auto_control_msg)))
  "Returns md5sum for a message object of type 'auto_control_msg"
  "563a60a06dd4f4297aa17e367a4fb89b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<auto_control_msg>)))
  "Returns full string definition for message of type '<auto_control_msg>"
  (cl:format cl:nil "float32[6] thrust_vec~%bool[6] dims_locked~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'auto_control_msg)))
  "Returns full string definition for message of type 'auto_control_msg"
  (cl:format cl:nil "float32[6] thrust_vec~%bool[6] dims_locked~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <auto_control_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'thrust_vec) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'dims_locked) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <auto_control_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'auto_control_msg
    (cl:cons ':thrust_vec (thrust_vec msg))
    (cl:cons ':dims_locked (dims_locked msg))
))
