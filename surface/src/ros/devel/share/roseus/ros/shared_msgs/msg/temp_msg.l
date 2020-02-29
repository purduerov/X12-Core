;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::temp_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'temp_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::TEMP_MSG")
  (make-package "SHARED_MSGS::TEMP_MSG"))

(in-package "ROS")
;;//! \htmlinclude temp_msg.msg.html


(defclass shared_msgs::temp_msg
  :super ros::object
  :slots (_temperature ))

(defmethod shared_msgs::temp_msg
  (:init
   (&key
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _temperature (float __temperature))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; float32 _temperature
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get shared_msgs::temp_msg :md5sum-) "694ab1a51fd38693b5cadd94c1ae252d")
(setf (get shared_msgs::temp_msg :datatype-) "shared_msgs/temp_msg")
(setf (get shared_msgs::temp_msg :definition-)
      "float32 temperature

")



(provide :shared_msgs/temp_msg "694ab1a51fd38693b5cadd94c1ae252d")


