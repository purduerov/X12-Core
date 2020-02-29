; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude thrust_status_msg.msg.html

(cl:defclass <thrust_status_msg> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass thrust_status_msg (<thrust_status_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <thrust_status_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'thrust_status_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<thrust_status_msg> is deprecated: use shared_msgs-msg:thrust_status_msg instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <thrust_status_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:status-val is deprecated.  Use shared_msgs-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <thrust_status_msg>) ostream)
  "Serializes a message object of type '<thrust_status_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <thrust_status_msg>) istream)
  "Deserializes a message object of type '<thrust_status_msg>"
  (cl:setf (cl:slot-value msg 'status) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'status)))
    (cl:dotimes (i 8)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<thrust_status_msg>)))
  "Returns string type for a message object of type '<thrust_status_msg>"
  "shared_msgs/thrust_status_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'thrust_status_msg)))
  "Returns string type for a message object of type 'thrust_status_msg"
  "shared_msgs/thrust_status_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<thrust_status_msg>)))
  "Returns md5sum for a message object of type '<thrust_status_msg>"
  "3de3e43f639d3c2c12cdae9fac020a2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'thrust_status_msg)))
  "Returns md5sum for a message object of type 'thrust_status_msg"
  "3de3e43f639d3c2c12cdae9fac020a2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<thrust_status_msg>)))
  "Returns full string definition for message of type '<thrust_status_msg>"
  (cl:format cl:nil "float32[8] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'thrust_status_msg)))
  "Returns full string definition for message of type 'thrust_status_msg"
  (cl:format cl:nil "float32[8] status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <thrust_status_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'status) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <thrust_status_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'thrust_status_msg
    (cl:cons ':status (status msg))
))
