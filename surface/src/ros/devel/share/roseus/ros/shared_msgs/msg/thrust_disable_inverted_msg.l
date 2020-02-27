;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::thrust_disable_inverted_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'thrust_disable_inverted_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::THRUST_DISABLE_INVERTED_MSG")
  (make-package "SHARED_MSGS::THRUST_DISABLE_INVERTED_MSG"))

(in-package "ROS")
;;//! \htmlinclude thrust_disable_inverted_msg.msg.html


(defclass shared_msgs::thrust_disable_inverted_msg
  :super ros::object
  :slots (_disable_thrusters _inverted ))

(defmethod shared_msgs::thrust_disable_inverted_msg
  (:init
   (&key
    ((:disable_thrusters __disable_thrusters) (let (r) (dotimes (i 8) (push nil r)) r))
    ((:inverted __inverted) (make-array 8 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _disable_thrusters __disable_thrusters)
   (setq _inverted __inverted)
   self)
  (:disable_thrusters
   (&optional __disable_thrusters)
   (if __disable_thrusters (setq _disable_thrusters __disable_thrusters)) _disable_thrusters)
  (:inverted
   (&optional __inverted)
   (if __inverted (setq _inverted __inverted)) _inverted)
  (:serialization-length
   ()
   (+
    ;; bool[8] _disable_thrusters
    (* 1    8)
    ;; int8[8] _inverted
    (* 1    8)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[8] _disable_thrusters
     (dotimes (i 8)
       (if (elt _disable_thrusters i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; int8[8] _inverted
     (dotimes (i 8)
       (write-byte (elt _inverted i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[8] _disable_thrusters
   (dotimes (i (length _disable_thrusters))
     (setf (elt _disable_thrusters i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; int8[8] _inverted
   (dotimes (i (length _inverted))
     (setf (elt _inverted i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _inverted i) 127) (setf (elt _inverted i) (- (elt _inverted i) 256)))
     )
   ;;
   self)
  )

(setf (get shared_msgs::thrust_disable_inverted_msg :md5sum-) "8b3d2e54482b6a65fb91c54d0d200315")
(setf (get shared_msgs::thrust_disable_inverted_msg :datatype-) "shared_msgs/thrust_disable_inverted_msg")
(setf (get shared_msgs::thrust_disable_inverted_msg :definition-)
      "bool[8] disable_thrusters
int8[8] inverted
")



(provide :shared_msgs/thrust_disable_inverted_msg "8b3d2e54482b6a65fb91c54d0d200315")


