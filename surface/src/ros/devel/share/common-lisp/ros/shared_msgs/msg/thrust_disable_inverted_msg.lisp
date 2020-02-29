; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude thrust_disable_inverted_msg.msg.html

(cl:defclass <thrust_disable_inverted_msg> (roslisp-msg-protocol:ros-message)
  ((disable_thrusters
    :reader disable_thrusters
    :initarg :disable_thrusters
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 8 :element-type 'cl:boolean :initial-element cl:nil))
   (inverted
    :reader inverted
    :initarg :inverted
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 8 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass thrust_disable_inverted_msg (<thrust_disable_inverted_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <thrust_disable_inverted_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'thrust_disable_inverted_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<thrust_disable_inverted_msg> is deprecated: use shared_msgs-msg:thrust_disable_inverted_msg instead.")))

(cl:ensure-generic-function 'disable_thrusters-val :lambda-list '(m))
(cl:defmethod disable_thrusters-val ((m <thrust_disable_inverted_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:disable_thrusters-val is deprecated.  Use shared_msgs-msg:disable_thrusters instead.")
  (disable_thrusters m))

(cl:ensure-generic-function 'inverted-val :lambda-list '(m))
(cl:defmethod inverted-val ((m <thrust_disable_inverted_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:inverted-val is deprecated.  Use shared_msgs-msg:inverted instead.")
  (inverted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <thrust_disable_inverted_msg>) ostream)
  "Serializes a message object of type '<thrust_disable_inverted_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'disable_thrusters))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'inverted))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <thrust_disable_inverted_msg>) istream)
  "Deserializes a message object of type '<thrust_disable_inverted_msg>"
  (cl:setf (cl:slot-value msg 'disable_thrusters) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'disable_thrusters)))
    (cl:dotimes (i 8)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  (cl:setf (cl:slot-value msg 'inverted) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'inverted)))
    (cl:dotimes (i 8)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<thrust_disable_inverted_msg>)))
  "Returns string type for a message object of type '<thrust_disable_inverted_msg>"
  "shared_msgs/thrust_disable_inverted_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'thrust_disable_inverted_msg)))
  "Returns string type for a message object of type 'thrust_disable_inverted_msg"
  "shared_msgs/thrust_disable_inverted_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<thrust_disable_inverted_msg>)))
  "Returns md5sum for a message object of type '<thrust_disable_inverted_msg>"
  "8b3d2e54482b6a65fb91c54d0d200315")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'thrust_disable_inverted_msg)))
  "Returns md5sum for a message object of type 'thrust_disable_inverted_msg"
  "8b3d2e54482b6a65fb91c54d0d200315")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<thrust_disable_inverted_msg>)))
  "Returns full string definition for message of type '<thrust_disable_inverted_msg>"
  (cl:format cl:nil "bool[8] disable_thrusters~%int8[8] inverted~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'thrust_disable_inverted_msg)))
  "Returns full string definition for message of type 'thrust_disable_inverted_msg"
  (cl:format cl:nil "bool[8] disable_thrusters~%int8[8] inverted~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <thrust_disable_inverted_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'disable_thrusters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'inverted) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <thrust_disable_inverted_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'thrust_disable_inverted_msg
    (cl:cons ':disable_thrusters (disable_thrusters msg))
    (cl:cons ':inverted (inverted msg))
))
