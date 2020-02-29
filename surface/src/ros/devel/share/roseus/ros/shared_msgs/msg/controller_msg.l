;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::controller_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'controller_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::CONTROLLER_MSG")
  (make-package "SHARED_MSGS::CONTROLLER_MSG"))

(in-package "ROS")
;;//! \htmlinclude controller_msg.msg.html


(defclass shared_msgs::controller_msg
  :super ros::object
  :slots (_RX_axis _RY_axis _LX_axis _LY_axis _a _b _x _y _DPadX _DPadY _RB _LB _Rtrigger _Ltrigger ))

(defmethod shared_msgs::controller_msg
  (:init
   (&key
    ((:RX_axis __RX_axis) 0.0)
    ((:RY_axis __RY_axis) 0.0)
    ((:LX_axis __LX_axis) 0.0)
    ((:LY_axis __LY_axis) 0.0)
    ((:a __a) 0)
    ((:b __b) 0)
    ((:x __x) 0)
    ((:y __y) 0)
    ((:DPadX __DPadX) 0)
    ((:DPadY __DPadY) 0)
    ((:RB __RB) 0)
    ((:LB __LB) 0)
    ((:Rtrigger __Rtrigger) 0.0)
    ((:Ltrigger __Ltrigger) 0.0)
    )
   (send-super :init)
   (setq _RX_axis (float __RX_axis))
   (setq _RY_axis (float __RY_axis))
   (setq _LX_axis (float __LX_axis))
   (setq _LY_axis (float __LY_axis))
   (setq _a (round __a))
   (setq _b (round __b))
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _DPadX (round __DPadX))
   (setq _DPadY (round __DPadY))
   (setq _RB (round __RB))
   (setq _LB (round __LB))
   (setq _Rtrigger (float __Rtrigger))
   (setq _Ltrigger (float __Ltrigger))
   self)
  (:RX_axis
   (&optional __RX_axis)
   (if __RX_axis (setq _RX_axis __RX_axis)) _RX_axis)
  (:RY_axis
   (&optional __RY_axis)
   (if __RY_axis (setq _RY_axis __RY_axis)) _RY_axis)
  (:LX_axis
   (&optional __LX_axis)
   (if __LX_axis (setq _LX_axis __LX_axis)) _LX_axis)
  (:LY_axis
   (&optional __LY_axis)
   (if __LY_axis (setq _LY_axis __LY_axis)) _LY_axis)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:DPadX
   (&optional __DPadX)
   (if __DPadX (setq _DPadX __DPadX)) _DPadX)
  (:DPadY
   (&optional __DPadY)
   (if __DPadY (setq _DPadY __DPadY)) _DPadY)
  (:RB
   (&optional __RB)
   (if __RB (setq _RB __RB)) _RB)
  (:LB
   (&optional __LB)
   (if __LB (setq _LB __LB)) _LB)
  (:Rtrigger
   (&optional __Rtrigger)
   (if __Rtrigger (setq _Rtrigger __Rtrigger)) _Rtrigger)
  (:Ltrigger
   (&optional __Ltrigger)
   (if __Ltrigger (setq _Ltrigger __Ltrigger)) _Ltrigger)
  (:serialization-length
   ()
   (+
    ;; float32 _RX_axis
    4
    ;; float32 _RY_axis
    4
    ;; float32 _LX_axis
    4
    ;; float32 _LY_axis
    4
    ;; int8 _a
    1
    ;; int8 _b
    1
    ;; int8 _x
    1
    ;; int8 _y
    1
    ;; int8 _DPadX
    1
    ;; int8 _DPadY
    1
    ;; int8 _RB
    1
    ;; int8 _LB
    1
    ;; float32 _Rtrigger
    4
    ;; float32 _Ltrigger
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _RX_axis
       (sys::poke _RX_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _RY_axis
       (sys::poke _RY_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _LX_axis
       (sys::poke _LX_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _LY_axis
       (sys::poke _LY_axis (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _a
       (write-byte _a s)
     ;; int8 _b
       (write-byte _b s)
     ;; int8 _x
       (write-byte _x s)
     ;; int8 _y
       (write-byte _y s)
     ;; int8 _DPadX
       (write-byte _DPadX s)
     ;; int8 _DPadY
       (write-byte _DPadY s)
     ;; int8 _RB
       (write-byte _RB s)
     ;; int8 _LB
       (write-byte _LB s)
     ;; float32 _Rtrigger
       (sys::poke _Rtrigger (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ltrigger
       (sys::poke _Ltrigger (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _RX_axis
     (setq _RX_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _RY_axis
     (setq _RY_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _LX_axis
     (setq _LX_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _LY_axis
     (setq _LY_axis (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _a
     (setq _a (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _a 127) (setq _a (- _a 256)))
   ;; int8 _b
     (setq _b (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _b 127) (setq _b (- _b 256)))
   ;; int8 _x
     (setq _x (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _x 127) (setq _x (- _x 256)))
   ;; int8 _y
     (setq _y (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _y 127) (setq _y (- _y 256)))
   ;; int8 _DPadX
     (setq _DPadX (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _DPadX 127) (setq _DPadX (- _DPadX 256)))
   ;; int8 _DPadY
     (setq _DPadY (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _DPadY 127) (setq _DPadY (- _DPadY 256)))
   ;; int8 _RB
     (setq _RB (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _RB 127) (setq _RB (- _RB 256)))
   ;; int8 _LB
     (setq _LB (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _LB 127) (setq _LB (- _LB 256)))
   ;; float32 _Rtrigger
     (setq _Rtrigger (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ltrigger
     (setq _Ltrigger (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get shared_msgs::controller_msg :md5sum-) "57ec734b5ac6013c2716cfd2d22db9b4")
(setf (get shared_msgs::controller_msg :datatype-) "shared_msgs/controller_msg")
(setf (get shared_msgs::controller_msg :definition-)
      "float32 RX_axis
float32 RY_axis
float32 LX_axis
float32 LY_axis
int8 a
int8 b
int8 x
int8 y
int8 DPadX
int8 DPadY
int8 RB
int8 LB
float32 Rtrigger
float32 Ltrigger

")



(provide :shared_msgs/controller_msg "57ec734b5ac6013c2716cfd2d22db9b4")


