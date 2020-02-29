;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::thrust_status_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'thrust_status_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::THRUST_STATUS_MSG")
  (make-package "SHARED_MSGS::THRUST_STATUS_MSG"))

(in-package "ROS")
;;//! \htmlinclude thrust_status_msg.msg.html


(defclass shared_msgs::thrust_status_msg
  :super ros::object
  :slots (_status ))

(defmethod shared_msgs::thrust_status_msg
  (:init
   (&key
    ((:status __status) (make-array 8 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; float32[8] _status
    (* 4    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[8] _status
     (dotimes (i 8)
       (sys::poke (elt _status i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[8] _status
   (dotimes (i (length _status))
     (setf (elt _status i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get shared_msgs::thrust_status_msg :md5sum-) "3de3e43f639d3c2c12cdae9fac020a2c")
(setf (get shared_msgs::thrust_status_msg :datatype-) "shared_msgs/thrust_status_msg")
(setf (get shared_msgs::thrust_status_msg :definition-)
      "float32[8] status

")



(provide :shared_msgs/thrust_status_msg "3de3e43f639d3c2c12cdae9fac020a2c")


