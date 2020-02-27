;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::thrust_command_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'thrust_command_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::THRUST_COMMAND_MSG")
  (make-package "SHARED_MSGS::THRUST_COMMAND_MSG"))

(in-package "ROS")
;;//! \htmlinclude thrust_command_msg.msg.html


(defclass shared_msgs::thrust_command_msg
  :super ros::object
  :slots (_desired_thrust ))

(defmethod shared_msgs::thrust_command_msg
  (:init
   (&key
    ((:desired_thrust __desired_thrust) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _desired_thrust __desired_thrust)
   self)
  (:desired_thrust
   (&optional __desired_thrust)
   (if __desired_thrust (setq _desired_thrust __desired_thrust)) _desired_thrust)
  (:serialization-length
   ()
   (+
    ;; float32[6] _desired_thrust
    (* 4    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[6] _desired_thrust
     (dotimes (i 6)
       (sys::poke (elt _desired_thrust i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[6] _desired_thrust
   (dotimes (i (length _desired_thrust))
     (setf (elt _desired_thrust i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get shared_msgs::thrust_command_msg :md5sum-) "799334c773133ce868f5247076316205")
(setf (get shared_msgs::thrust_command_msg :datatype-) "shared_msgs/thrust_command_msg")
(setf (get shared_msgs::thrust_command_msg :definition-)
      "float32[6] desired_thrust



")



(provide :shared_msgs/thrust_command_msg "799334c773133ce868f5247076316205")


