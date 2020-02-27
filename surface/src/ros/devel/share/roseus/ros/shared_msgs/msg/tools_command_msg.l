;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::tools_command_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'tools_command_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::TOOLS_COMMAND_MSG")
  (make-package "SHARED_MSGS::TOOLS_COMMAND_MSG"))

(in-package "ROS")
;;//! \htmlinclude tools_command_msg.msg.html


(defclass shared_msgs::tools_command_msg
  :super ros::object
  :slots (_manipulator _groutTrout _liftBag _marker ))

(defmethod shared_msgs::tools_command_msg
  (:init
   (&key
    ((:manipulator __manipulator) 0)
    ((:groutTrout __groutTrout) 0)
    ((:liftBag __liftBag) 0)
    ((:marker __marker) 0)
    )
   (send-super :init)
   (setq _manipulator (round __manipulator))
   (setq _groutTrout (round __groutTrout))
   (setq _liftBag (round __liftBag))
   (setq _marker (round __marker))
   self)
  (:manipulator
   (&optional __manipulator)
   (if __manipulator (setq _manipulator __manipulator)) _manipulator)
  (:groutTrout
   (&optional __groutTrout)
   (if __groutTrout (setq _groutTrout __groutTrout)) _groutTrout)
  (:liftBag
   (&optional __liftBag)
   (if __liftBag (setq _liftBag __liftBag)) _liftBag)
  (:marker
   (&optional __marker)
   (if __marker (setq _marker __marker)) _marker)
  (:serialization-length
   ()
   (+
    ;; int8 _manipulator
    1
    ;; int8 _groutTrout
    1
    ;; int8 _liftBag
    1
    ;; int8 _marker
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _manipulator
       (write-byte _manipulator s)
     ;; int8 _groutTrout
       (write-byte _groutTrout s)
     ;; int8 _liftBag
       (write-byte _liftBag s)
     ;; int8 _marker
       (write-byte _marker s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _manipulator
     (setq _manipulator (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _manipulator 127) (setq _manipulator (- _manipulator 256)))
   ;; int8 _groutTrout
     (setq _groutTrout (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _groutTrout 127) (setq _groutTrout (- _groutTrout 256)))
   ;; int8 _liftBag
     (setq _liftBag (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _liftBag 127) (setq _liftBag (- _liftBag 256)))
   ;; int8 _marker
     (setq _marker (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _marker 127) (setq _marker (- _marker 256)))
   ;;
   self)
  )

(setf (get shared_msgs::tools_command_msg :md5sum-) "99400b8a44513c5ef4f0bf7e444e5295")
(setf (get shared_msgs::tools_command_msg :datatype-) "shared_msgs/tools_command_msg")
(setf (get shared_msgs::tools_command_msg :definition-)
      "int8 manipulator
int8 groutTrout
int8 liftBag
int8 marker


")



(provide :shared_msgs/tools_command_msg "99400b8a44513c5ef4f0bf7e444e5295")


