;; Auto-generated. Do not edit!


(when (boundp 'shared_msgs::i2c_msg)
  (if (not (find-package "SHARED_MSGS"))
    (make-package "SHARED_MSGS"))
  (shadow 'i2c_msg (find-package "SHARED_MSGS")))
(unless (find-package "SHARED_MSGS::I2C_MSG")
  (make-package "SHARED_MSGS::I2C_MSG"))

(in-package "ROS")
;;//! \htmlinclude i2c_msg.msg.html


(defclass shared_msgs::i2c_msg
  :super ros::object
  :slots (_addr _data ))

(defmethod shared_msgs::i2c_msg
  (:init
   (&key
    ((:addr __addr) 0)
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _addr (round __addr))
   (setq _data (round __data))
   self)
  (:addr
   (&optional __addr)
   (if __addr (setq _addr __addr)) _addr)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint8 _addr
    1
    ;; uint64 _data
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _addr
       (write-byte _addr s)
     ;; uint64 _data
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _data (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _data) (= (length (_data . bv)) 2)) ;; bignum
              (write-long (ash (elt (_data . bv) 0) 0) s)
              (write-long (ash (elt (_data . bv) 1) -1) s))
             ((and (class _data) (= (length (_data . bv)) 1)) ;; big1
              (write-long (elt (_data . bv) 0) s)
              (write-long (if (>= _data 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _data s)(write-long (if (>= _data 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _addr
     (setq _addr (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint64 _data
     
#+(or :alpha :irix6 :x86_64)
      (setf _data (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _data (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get shared_msgs::i2c_msg :md5sum-) "b186db14e4c5189ed032baff6e0239ff")
(setf (get shared_msgs::i2c_msg :datatype-) "shared_msgs/i2c_msg")
(setf (get shared_msgs::i2c_msg :definition-)
      "uint8 addr
uint64 data

")



(provide :shared_msgs/i2c_msg "b186db14e4c5189ed032baff6e0239ff")


