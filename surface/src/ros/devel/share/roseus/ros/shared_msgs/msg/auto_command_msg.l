;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::auto_command_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'auto_command_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::AUTO_COMMAND_MSG")
  (make-package "SHARED_MSGS::AUTO_COMMAND_MSG"))

(in-package "ROS")
;;//! \htmlinclude auto_command_msg.msg.html


(defclass shared_msgs::auto_command_msg
  :super ros::object
  :slots (_stabilization_dim ))

(defmethod shared_msgs::auto_command_msg
  (:init
   (&key
    ((:stabilization_dim __stabilization_dim) (make-array 6 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _stabilization_dim __stabilization_dim)
   self)
  (:stabilization_dim
   (&optional __stabilization_dim)
   (if __stabilization_dim (setq _stabilization_dim __stabilization_dim)) _stabilization_dim)
  (:serialization-length
   ()
   (+
    ;; int8[6] _stabilization_dim
    (* 1    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[6] _stabilization_dim
     (dotimes (i 6)
       (write-byte (elt _stabilization_dim i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[6] _stabilization_dim
   (dotimes (i (length _stabilization_dim))
     (setf (elt _stabilization_dim i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _stabilization_dim i) 127) (setf (elt _stabilization_dim i) (- (elt _stabilization_dim i) 256)))
     )
   ;;
   self)
  )

(setf (get shared_msgs::auto_command_msg :md5sum-) "4362e29932548ed2712d3d546a04a23c")
(setf (get shared_msgs::auto_command_msg :datatype-) "shared_msgs/auto_command_msg")
(setf (get shared_msgs::auto_command_msg :definition-)
      "int8[6] stabilization_dim

")



(provide :shared_msgs/auto_command_msg "4362e29932548ed2712d3d546a04a23c")


