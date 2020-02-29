; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude auto_command_msg.msg.html

(cl:defclass <auto_command_msg> (roslisp-msg-protocol:ros-message)
  ((stabilization_dim
    :reader stabilization_dim
    :initarg :stabilization_dim
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 6 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass auto_command_msg (<auto_command_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <auto_command_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'auto_command_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<auto_command_msg> is deprecated: use shared_msgs-msg:auto_command_msg instead.")))

(cl:ensure-generic-function 'stabilization_dim-val :lambda-list '(m))
(cl:defmethod stabilization_dim-val ((m <auto_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:stabilization_dim-val is deprecated.  Use shared_msgs-msg:stabilization_dim instead.")
  (stabilization_dim m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <auto_command_msg>) ostream)
  "Serializes a message object of type '<auto_command_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'stabilization_dim))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <auto_command_msg>) istream)
  "Deserializes a message object of type '<auto_command_msg>"
  (cl:setf (cl:slot-value msg 'stabilization_dim) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'stabilization_dim)))
    (cl:dotimes (i 6)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<auto_command_msg>)))
  "Returns string type for a message object of type '<auto_command_msg>"
  "shared_msgs/auto_command_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'auto_command_msg)))
  "Returns string type for a message object of type 'auto_command_msg"
  "shared_msgs/auto_command_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<auto_command_msg>)))
  "Returns md5sum for a message object of type '<auto_command_msg>"
  "4362e29932548ed2712d3d546a04a23c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'auto_command_msg)))
  "Returns md5sum for a message object of type 'auto_command_msg"
  "4362e29932548ed2712d3d546a04a23c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<auto_command_msg>)))
  "Returns full string definition for message of type '<auto_command_msg>"
  (cl:format cl:nil "int8[6] stabilization_dim~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'auto_command_msg)))
  "Returns full string definition for message of type 'auto_command_msg"
  (cl:format cl:nil "int8[6] stabilization_dim~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <auto_command_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'stabilization_dim) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <auto_command_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'auto_command_msg
    (cl:cons ':stabilization_dim (stabilization_dim msg))
))
