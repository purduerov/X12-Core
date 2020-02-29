;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::esc_single_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'esc_single_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::ESC_SINGLE_MSG")
  (make-package "SHARED_MSGS::ESC_SINGLE_MSG"))

(in-package "ROS")
;;//! \htmlinclude esc_single_msg.msg.html


(defclass shared_msgs::esc_single_msg
  :super ros::object
  :slots (_current _temperature ))

(defmethod shared_msgs::esc_single_msg
  (:init
   (&key
    ((:current __current) 0.0)
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _current (float __current))
   (setq _temperature (float __temperature))
   self)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; float32 _current
    4
    ;; float32 _temperature
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _current
       (sys::poke _current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _current
     (setq _current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get shared_msgs::esc_single_msg :md5sum-) "bcd9c34c6b5710978aab3ba057678b88")
(setf (get shared_msgs::esc_single_msg :datatype-) "shared_msgs/esc_single_msg")
(setf (get shared_msgs::esc_single_msg :definition-)
      "float32 current
float32 temperature

")



(provide :shared_msgs/esc_single_msg "bcd9c34c6b5710978aab3ba057678b88")


