;; Auto-generated. Do not edit!


(when (boundp 'meno_matky_za_slobodna::Stop)
  (if (not (find-package "MENO_MATKY_ZA_SLOBODNA"))
    (make-package "MENO_MATKY_ZA_SLOBODNA"))
  (shadow 'Stop (find-package "MENO_MATKY_ZA_SLOBODNA")))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::STOP")
  (make-package "MENO_MATKY_ZA_SLOBODNA::STOP"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::STOPREQUEST")
  (make-package "MENO_MATKY_ZA_SLOBODNA::STOPREQUEST"))
(unless (find-package "MENO_MATKY_ZA_SLOBODNA::STOPRESPONSE")
  (make-package "MENO_MATKY_ZA_SLOBODNA::STOPRESPONSE"))

(in-package "ROS")





(defclass meno_matky_za_slobodna::StopRequest
  :super ros::object
  :slots ())

(defmethod meno_matky_za_slobodna::StopRequest
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

(defclass meno_matky_za_slobodna::StopResponse
  :super ros::object
  :slots (_success ))

(defmethod meno_matky_za_slobodna::StopResponse
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

(defclass meno_matky_za_slobodna::Stop
  :super ros::object
  :slots ())

(setf (get meno_matky_za_slobodna::Stop :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::Stop :datatype-) "meno_matky_za_slobodna/Stop")
(setf (get meno_matky_za_slobodna::Stop :request) meno_matky_za_slobodna::StopRequest)
(setf (get meno_matky_za_slobodna::Stop :response) meno_matky_za_slobodna::StopResponse)

(defmethod meno_matky_za_slobodna::StopRequest
  (:response () (instance meno_matky_za_slobodna::StopResponse :init)))

(setf (get meno_matky_za_slobodna::StopRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::StopRequest :datatype-) "meno_matky_za_slobodna/StopRequest")
(setf (get meno_matky_za_slobodna::StopRequest :definition-)
      "---
bool success
")

(setf (get meno_matky_za_slobodna::StopResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get meno_matky_za_slobodna::StopResponse :datatype-) "meno_matky_za_slobodna/StopResponse")
(setf (get meno_matky_za_slobodna::StopResponse :definition-)
      "---
bool success
")



(provide :meno_matky_za_slobodna/Stop "358e233cde0c8a8bcfea4ce193f8fc15")


