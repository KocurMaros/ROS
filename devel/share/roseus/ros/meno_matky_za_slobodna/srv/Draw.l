;; Auto-generated. Do not edit!


(when (boundp 'meno_matky_za_slobodna::Draw)
  (if (not (find-package "MENO_MATKY_ZA_SLOBODNA"))
    (make-package "MENO_MATKY_ZA_SLOBODNA"))
  (shadow 'Draw (find-package "MENO_MATKY_ZA_SLOBODNA")))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::DRAW")
  (make-package "MENO_MATKY_ZA_SLOBODNA::DRAW"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::DRAWREQUEST")
  (make-package "MENO_MATKY_ZA_SLOBODNA::DRAWREQUEST"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::DRAWRESPONSE")
  (make-package "MENO_MATKY_ZA_SLOBODNA::DRAWRESPONSE"))

(in-package "ROS")





(defclass meno_matky_za_slobodna::DrawRequest
  :super ros::object
  :slots (_speed _angle ))

(defmethod meno_matky_za_slobodna::DrawRequest
  (:init
   (&key
    ((:speed __speed) 0)
    ((:angle __angle) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _angle (round __angle))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; int64 _speed
    8
    ;; int64 _angle
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
     ;; int64 _angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _angle) (= (length (_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_angle . bv) 0) 0) s)
              (write-long (ash (elt (_angle . bv) 1) -1) s))
             ((and (class _angle) (= (length (_angle . bv)) 1)) ;; big1
              (write-long (elt (_angle . bv) 0) s)
              (write-long (if (>= _angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _angle s)(write-long (if (>= _angle 0) 0 #xffffffff) s)))
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
   ;; int64 _angle
#+(or :alpha :irix6 :x86_64)
      (setf _angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass meno_matky_za_slobodna::DrawResponse
  :super ros::object
  :slots (_success ))

(defmethod meno_matky_za_slobodna::DrawResponse
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

(defclass meno_matky_za_slobodna::Draw
  :super ros::object
  :slots ())

(setf (get meno_matky_za_slobodna::Draw :md5sum-) "e5eddf88ccd24f8d174671b7bb6a7674")
(setf (get meno_matky_za_slobodna::Draw :datatype-) "meno_matky_za_slobodna/Draw")
(setf (get meno_matky_za_slobodna::Draw :request) meno_matky_za_slobodna::DrawRequest)
(setf (get meno_matky_za_slobodna::Draw :response) meno_matky_za_slobodna::DrawResponse)

(defmethod meno_matky_za_slobodna::DrawRequest
  (:response () (instance meno_matky_za_slobodna::DrawResponse :init)))

(setf (get meno_matky_za_slobodna::DrawRequest :md5sum-) "e5eddf88ccd24f8d174671b7bb6a7674")
(setf (get meno_matky_za_slobodna::DrawRequest :datatype-) "meno_matky_za_slobodna/DrawRequest")
(setf (get meno_matky_za_slobodna::DrawRequest :definition-)
      "int64 speed
int64 angle
---
bool success
")

(setf (get meno_matky_za_slobodna::DrawResponse :md5sum-) "e5eddf88ccd24f8d174671b7bb6a7674")
(setf (get meno_matky_za_slobodna::DrawResponse :datatype-) "meno_matky_za_slobodna/DrawResponse")
(setf (get meno_matky_za_slobodna::DrawResponse :definition-)
      "int64 speed
int64 angle
---
bool success
")



(provide :meno_matky_za_slobodna/Draw "e5eddf88ccd24f8d174671b7bb6a7674")


