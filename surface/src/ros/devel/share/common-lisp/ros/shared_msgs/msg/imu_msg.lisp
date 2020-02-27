; Auto-generated. Do not edit!


(cl:in-package shared_msgs-msg)


;//! \htmlinclude imu_msg.msg.html

(cl:defclass <imu_msg> (roslisp-msg-protocol:ros-message)
  ((gyro
    :reader gyro
    :initarg :gyro
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (accel
    :reader accel
    :initarg :accel
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass imu_msg (<imu_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imu_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imu_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name shared_msgs-msg:<imu_msg> is deprecated: use shared_msgs-msg:imu_msg instead.")))

(cl:ensure-generic-function 'gyro-val :lambda-list '(m))
(cl:defmethod gyro-val ((m <imu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:gyro-val is deprecated.  Use shared_msgs-msg:gyro instead.")
  (gyro m))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <imu_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader shared_msgs-msg:accel-val is deprecated.  Use shared_msgs-msg:accel instead.")
  (accel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imu_msg>) ostream)
  "Serializes a message object of type '<imu_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'gyro))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'accel))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imu_msg>) istream)
  "Deserializes a message object of type '<imu_msg>"
  (cl:setf (cl:slot-value msg 'gyro) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'gyro)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'accel) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'accel)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imu_msg>)))
  "Returns string type for a message object of type '<imu_msg>"
  "shared_msgs/imu_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imu_msg)))
  "Returns string type for a message object of type 'imu_msg"
  "shared_msgs/imu_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imu_msg>)))
  "Returns md5sum for a message object of type '<imu_msg>"
  "ce45cc38daa7ab1aa2192631b286b0ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imu_msg)))
  "Returns md5sum for a message object of type 'imu_msg"
  "ce45cc38daa7ab1aa2192631b286b0ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imu_msg>)))
  "Returns full string definition for message of type '<imu_msg>"
  (cl:format cl:nil "float32[3] gyro~%float32[3] accel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imu_msg)))
  "Returns full string definition for message of type 'imu_msg"
  (cl:format cl:nil "float32[3] gyro~%float32[3] accel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imu_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'gyro) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'accel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imu_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'imu_msg
    (cl:cons ':gyro (gyro msg))
    (cl:cons ':accel (accel msg))
))
