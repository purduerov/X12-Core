;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::final_thrust_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'final_thrust_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::FINAL_THRUST_MSG")
  (make-package "SHARED_MSGS::FINAL_THRUST_MSG"))

(in-package "ROS")
;;//! \htmlinclude final_thrust_msg.msg.html


(defclass shared_msgs::final_thrust_msg
  :super ros::object
  :slots (_hfl _hfr _hbr _hbl _vfl _vfr _vbr _vbl ))

(defmethod shared_msgs::final_thrust_msg
  (:init
   (&key
    ((:hfl __hfl) 0)
    ((:hfr __hfr) 0)
    ((:hbr __hbr) 0)
    ((:hbl __hbl) 0)
    ((:vfl __vfl) 0)
    ((:vfr __vfr) 0)
    ((:vbr __vbr) 0)
    ((:vbl __vbl) 0)
    )
   (send-super :init)
   (setq _hfl (round __hfl))
   (setq _hfr (round __hfr))
   (setq _hbr (round __hbr))
   (setq _hbl (round __hbl))
   (setq _vfl (round __vfl))
   (setq _vfr (round __vfr))
   (setq _vbr (round __vbr))
   (setq _vbl (round __vbl))
   self)
  (:hfl
   (&optional __hfl)
   (if __hfl (setq _hfl __hfl)) _hfl)
  (:hfr
   (&optional __hfr)
   (if __hfr (setq _hfr __hfr)) _hfr)
  (:hbr
   (&optional __hbr)
   (if __hbr (setq _hbr __hbr)) _hbr)
  (:hbl
   (&optional __hbl)
   (if __hbl (setq _hbl __hbl)) _hbl)
  (:vfl
   (&optional __vfl)
   (if __vfl (setq _vfl __vfl)) _vfl)
  (:vfr
   (&optional __vfr)
   (if __vfr (setq _vfr __vfr)) _vfr)
  (:vbr
   (&optional __vbr)
   (if __vbr (setq _vbr __vbr)) _vbr)
  (:vbl
   (&optional __vbl)
   (if __vbl (setq _vbl __vbl)) _vbl)
  (:serialization-length
   ()
   (+
    ;; uint8 _hfl
    1
    ;; uint8 _hfr
    1
    ;; uint8 _hbr
    1
    ;; uint8 _hbl
    1
    ;; uint8 _vfl
    1
    ;; uint8 _vfr
    1
    ;; uint8 _vbr
    1
    ;; uint8 _vbl
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _hfl
       (write-byte _hfl s)
     ;; uint8 _hfr
       (write-byte _hfr s)
     ;; uint8 _hbr
       (write-byte _hbr s)
     ;; uint8 _hbl
       (write-byte _hbl s)
     ;; uint8 _vfl
       (write-byte _vfl s)
     ;; uint8 _vfr
       (write-byte _vfr s)
     ;; uint8 _vbr
       (write-byte _vbr s)
     ;; uint8 _vbl
       (write-byte _vbl s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _hfl
     (setq _hfl (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hfr
     (setq _hfr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hbr
     (setq _hbr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _hbl
     (setq _hbl (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _vfl
     (setq _vfl (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _vfr
     (setq _vfr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _vbr
     (setq _vbr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _vbl
     (setq _vbl (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get shared_msgs::final_thrust_msg :md5sum-) "6ec19b411594e3b47b780fbf91db2d37")
(setf (get shared_msgs::final_thrust_msg :datatype-) "shared_msgs/final_thrust_msg")
(setf (get shared_msgs::final_thrust_msg :definition-)
      "uint8 hfl
uint8 hfr
uint8 hbr
uint8 hbl
uint8 vfl
uint8 vfr
uint8 vbr
uint8 vbl

")



(provide :shared_msgs/final_thrust_msg "6ec19b411594e3b47b780fbf91db2d37")


