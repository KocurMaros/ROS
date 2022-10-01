;; Auto-generated. Do not edit!


(when (boundp 'rrm_cv1::Draw)
  (if (not (find-package "RRM_CV1"))
    (make-package "RRM_CV1"))
  (shadow 'Draw (find-package "RRM_CV1")))
(unless (find-package "RRM_CV1::DRAW")
  (make-package "RRM_CV1::DRAW"))
(unless (find-package "RRM_CV1::DRAWREQUEST")
  (make-package "RRM_CV1::DRAWREQUEST"))
(unless (find-package "RRM_CV1::DRAWRESPONSE")
  (make-package "RRM_CV1::DRAWRESPONSE"))

(in-package "ROS")





(defclass rrm_cv1::DrawRequest
  :super ros::object
  :slots (_speed ))

(defmethod rrm_cv1::DrawRequest
  (:init
   (&key
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _speed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _speed) (= (length (_speed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_speed . bv) 0) 0) s)
              (write-long (ash (elt (_speed . bv) 1) -1) s))
             ((and (class _speed) (= (length (_speed . bv)) 1)) ;; big1
              (write-long (elt (_speed . bv) 0) s)
              (write-long (if (>= _speed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _speed s)(write-long (if (>= _speed 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
      (setf _speed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _speed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass rrm_cv1::DrawResponse
  :super ros::object
  :slots (_success ))

(defmethod rrm_cv1::DrawResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass rrm_cv1::Draw
  :super ros::object
  :slots ())

(setf (get rrm_cv1::Draw :md5sum-) "8b2c4ed0ef6d3410f781d1290f9db82d")
(setf (get rrm_cv1::Draw :datatype-) "rrm_cv1/Draw")
(setf (get rrm_cv1::Draw :request) rrm_cv1::DrawRequest)
(setf (get rrm_cv1::Draw :response) rrm_cv1::DrawResponse)

(defmethod rrm_cv1::DrawRequest
  (:response () (instance rrm_cv1::DrawResponse :init)))

(setf (get rrm_cv1::DrawRequest :md5sum-) "8b2c4ed0ef6d3410f781d1290f9db82d")
(setf (get rrm_cv1::DrawRequest :datatype-) "rrm_cv1/DrawRequest")
(setf (get rrm_cv1::DrawRequest :definition-)
      "int64 speed
---
bool success
")

(setf (get rrm_cv1::DrawResponse :md5sum-) "8b2c4ed0ef6d3410f781d1290f9db82d")
(setf (get rrm_cv1::DrawResponse :datatype-) "rrm_cv1/DrawResponse")
(setf (get rrm_cv1::DrawResponse :definition-)
      "int64 speed
---
bool success
")



(provide :rrm_cv1/Draw "8b2c4ed0ef6d3410f781d1290f9db82d")


