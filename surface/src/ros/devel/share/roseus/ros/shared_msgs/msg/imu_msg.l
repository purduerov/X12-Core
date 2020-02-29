;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::imu_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'imu_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::IMU_MSG")
  (make-package "SHARED_MSGS::IMU_MSG"))

(in-package "ROS")
;;//! \htmlinclude imu_msg.msg.html


(defclass shared_msgs::imu_msg
  :super ros::object
  :slots (_gyro _accel ))

(defmethod shared_msgs::imu_msg
  (:init
   (&key
    ((:gyro __gyro) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:accel __accel) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _gyro __gyro)
   (setq _accel __accel)
   self)
  (:gyro
   (&optional __gyro)
   (if __gyro (setq _gyro __gyro)) _gyro)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:serialization-length
   ()
   (+
    ;; float32[3] _gyro
    (* 4    3)
    ;; float32[3] _accel
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _gyro
     (dotimes (i 3)
       (sys::poke (elt _gyro i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _accel
     (dotimes (i 3)
       (sys::poke (elt _accel i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _gyro
   (dotimes (i (length _gyro))
     (setf (elt _gyro i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _accel
   (dotimes (i (length _accel))
     (setf (elt _accel i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get shared_msgs::imu_msg :md5sum-) "ce45cc38daa7ab1aa2192631b286b0ce")
(setf (get shared_msgs::imu_msg :datatype-) "shared_msgs/imu_msg")
(setf (get shared_msgs::imu_msg :definition-)
      "float32[3] gyro
float32[3] accel


")



(provide :shared_msgs/imu_msg "ce45cc38daa7ab1aa2192631b286b0ce")


