;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::auto_control_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'auto_control_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::AUTO_CONTROL_MSG")
  (make-package "SHARED_MSGS::AUTO_CONTROL_MSG"))

(in-package "ROS")
;;//! \htmlinclude auto_control_msg.msg.html


(defclass shared_msgs::auto_control_msg
  :super ros::object
  :slots (_thrust_vec _dims_locked ))

(defmethod shared_msgs::auto_control_msg
  (:init
   (&key
    ((:thrust_vec __thrust_vec) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:dims_locked __dims_locked) (let (r) (dotimes (i 6) (push nil r)) r))
    )
   (send-super :init)
   (setq _thrust_vec __thrust_vec)
   (setq _dims_locked __dims_locked)
   self)
  (:thrust_vec
   (&optional __thrust_vec)
   (if __thrust_vec (setq _thrust_vec __thrust_vec)) _thrust_vec)
  (:dims_locked
   (&optional __dims_locked)
   (if __dims_locked (setq _dims_locked __dims_locked)) _dims_locked)
  (:serialization-length
   ()
   (+
    ;; float32[6] _thrust_vec
    (* 4    6)
    ;; bool[6] _dims_locked
    (* 1    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[6] _thrust_vec
     (dotimes (i 6)
       (sys::poke (elt _thrust_vec i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool[6] _dims_locked
     (dotimes (i 6)
       (if (elt _dims_locked i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[6] _thrust_vec
   (dotimes (i (length _thrust_vec))
     (setf (elt _thrust_vec i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; bool[6] _dims_locked
   (dotimes (i (length _dims_locked))
     (setf (elt _dims_locked i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;;
   self)
  )

(setf (get shared_msgs::auto_control_msg :md5sum-) "563a60a06dd4f4297aa17e367a4fb89b")
(setf (get shared_msgs::auto_control_msg :datatype-) "shared_msgs/auto_control_msg")
(setf (get shared_msgs::auto_control_msg :definition-)
      "float32[6] thrust_vec
bool[6] dims_locked

")



(provide :shared_msgs/auto_control_msg "563a60a06dd4f4297aa17e367a4fb89b")


