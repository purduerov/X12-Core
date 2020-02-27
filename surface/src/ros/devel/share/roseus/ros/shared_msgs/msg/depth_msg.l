;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::depth_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'depth_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::DEPTH_MSG")
  (make-package "SHARED_MSGS::DEPTH_MSG"))

(in-package "ROS")
;;//! \htmlinclude depth_msg.msg.html


(defclass shared_msgs::depth_msg
  :super ros::object
  :slots (_pressure ))

(defmethod shared_msgs::depth_msg
  (:init
   (&key
    ((:pressure __pressure) 0.0)
    )
   (send-super :init)
   (setq _pressure (float __pressure))
   self)
  (:pressure
   (&optional __pressure)
   (if __pressure (setq _pressure __pressure)) _pressure)
  (:serialization-length
   ()
   (+
    ;; float32 _pressure
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pressure
       (sys::poke _pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pressure
     (setq _pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get shared_msgs::depth_msg :md5sum-) "d08eeab8c09d2ba14f8144e3bbf40d21")
(setf (get shared_msgs::depth_msg :datatype-) "shared_msgs/depth_msg")
(setf (get shared_msgs::depth_msg :definition-)
      "float32 pressure

")



(provide :shared_msgs/depth_msg "d08eeab8c09d2ba14f8144e3bbf40d21")


