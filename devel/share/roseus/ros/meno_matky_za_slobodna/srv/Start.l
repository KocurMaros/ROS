;; Auto-generated. Do not edit!


(when (boundp 'meno_matky_za_slobodna::Start)
  (if (not (find-package "MENO_MATKY_ZA_SLOBODNA"))
    (make-package "MENO_MATKY_ZA_SLOBODNA"))
  (shadow 'Start (find-package "MENO_MATKY_ZA_SLOBODNA")))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::START")
  (make-package "MENO_MATKY_ZA_SLOBODNA::START"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::STARTREQUEST")
  (make-package "MENO_MATKY_ZA_SLOBODNA::STARTREQUEST"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::STARTRESPONSE")
  (make-package "MENO_MATKY_ZA_SLOBODNA::STARTRESPONSE"))

(in-package "ROS")





(defclass meno_matky_za_slobodna::StartRequest
  :super ros::object
  :slots ())

(defmethod meno_matky_za_slobodna::StartRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass meno_matky_za_slobodna::StartResponse
  :super ros::object
  :slots (_success ))

(defmethod meno_matky_za_slobodna::StartResponse
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

(defclass meno_matky_za_slobodna::Start
  :super ros::object
  :slots ())

(setf (get meno_matky_za_slobodna::Start :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::Start :datatype-) "meno_matky_za_slobodna/Start")
(setf (get meno_matky_za_slobodna::Start :request) meno_matky_za_slobodna::StartRequest)
(setf (get meno_matky_za_slobodna::Start :response) meno_matky_za_slobodna::StartResponse)

(defmethod meno_matky_za_slobodna::StartRequest
  (:response () (instance meno_matky_za_slobodna::StartResponse :init)))

(setf (get meno_matky_za_slobodna::StartRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::StartRequest :datatype-) "meno_matky_za_slobodna/StartRequest")
(setf (get meno_matky_za_slobodna::StartRequest :definition-)
      "---
bool success
")

(setf (get meno_matky_za_slobodna::StartResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::StartResponse :datatype-) "meno_matky_za_slobodna/StartResponse")
(setf (get meno_matky_za_slobodna::StartResponse :definition-)
      "---
bool success
")



(provide :meno_matky_za_slobodna/Start "358e233cde0c8a8bcfea4ce193f8fc15")


