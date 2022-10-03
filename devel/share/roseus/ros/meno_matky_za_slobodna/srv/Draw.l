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
  :slots (_radius ))

(defmethod meno_matky_za_slobodna::DrawRequest
  (:init
   (&key
    ((:radius __radius) 0)
    )
   (send-super :init)
   (setq _radius (round __radius))
   self)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:serialization-length
   ()
   (+
    ;; int64 _radius
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _radius
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _radius (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _radius) (= (length (_radius . bv)) 2)) ;; bignum
              (write-long (ash (elt (_radius . bv) 0) 0) s)
              (write-long (ash (elt (_radius . bv) 1) -1) s))
             ((and (class _radius) (= (length (_radius . bv)) 1)) ;; big1
              (write-long (elt (_radius . bv) 0) s)
              (write-long (if (>= _radius 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _radius s)(write-long (if (>= _radius 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _radius
#+(or :alpha :irix6 :x86_64)
      (setf _radius (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _radius (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get meno_matky_za_slobodna::Draw :md5sum-) "ff56ab10127485a25e50efa6f63c433b")
(setf (get meno_matky_za_slobodna::Draw :datatype-) "meno_matky_za_slobodna/Draw")
(setf (get meno_matky_za_slobodna::Draw :request) meno_matky_za_slobodna::DrawRequest)
(setf (get meno_matky_za_slobodna::Draw :response) meno_matky_za_slobodna::DrawResponse)

(defmethod meno_matky_za_slobodna::DrawRequest
  (:response () (instance meno_matky_za_slobodna::DrawResponse :init)))

(setf (get meno_matky_za_slobodna::DrawRequest :md5sum-) "ff56ab10127485a25e50efa6f63c433b")
(setf (get meno_matky_za_slobodna::DrawRequest :datatype-) "meno_matky_za_slobodna/DrawRequest")
(setf (get meno_matky_za_slobodna::DrawRequest :definition-)
      "int64 radius
---
bool success
")

(setf (get meno_matky_za_slobodna::DrawResponse :md5sum-) "ff56ab10127485a25e50efa6f63c433b")
(setf (get meno_matky_za_slobodna::DrawResponse :datatype-) "meno_matky_za_slobodna/DrawResponse")
(setf (get meno_matky_za_slobodna::DrawResponse :definition-)
      "int64 radius
---
bool success
")



(provide :meno_matky_za_slobodna/Draw "ff56ab10127485a25e50efa6f63c433b")


