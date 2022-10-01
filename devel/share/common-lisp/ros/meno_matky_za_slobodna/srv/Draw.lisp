; Auto-generated. Do not edit!


(cl:in-package meno_matky_za_slobodna-srv)


;//! \htmlinclude Draw-request.msg.html

(cl:defclass <Draw-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:integer
    :initform 0))
)

(cl:defclass Draw-request (<Draw-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Draw-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Draw-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name meno_matky_za_slobodna-srv:<Draw-request> is deprecated: use meno_matky_za_slobodna-srv:Draw-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Draw-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader meno_matky_za_slobodna-srv:speed-val is deprecated.  Use meno_matky_za_slobodna-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Draw-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader meno_matky_za_slobodna-srv:angle-val is deprecated.  Use meno_matky_za_slobodna-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Draw-request>) ostream)
  "Serializes a message object of type '<Draw-request>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Draw-request>) istream)
  "Deserializes a message object of type '<Draw-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Draw-request>)))
  "Returns string type for a service object of type '<Draw-request>"
  "meno_matky_za_slobodna/DrawRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Draw-request)))
  "Returns string type for a service object of type 'Draw-request"
  "meno_matky_za_slobodna/DrawRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Draw-request>)))
  "Returns md5sum for a message object of type '<Draw-request>"
  "e5eddf88ccd24f8d174671b7bb6a7674")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Draw-request)))
  "Returns md5sum for a message object of type 'Draw-request"
  "e5eddf88ccd24f8d174671b7bb6a7674")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Draw-request>)))
  "Returns full string definition for message of type '<Draw-request>"
  (cl:format cl:nil "int64 speed~%int64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Draw-request)))
  "Returns full string definition for message of type 'Draw-request"
  (cl:format cl:nil "int64 speed~%int64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Draw-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Draw-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Draw-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':angle (angle msg))
))
;//! \htmlinclude Draw-response.msg.html

(cl:defclass <Draw-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Draw-response (<Draw-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Draw-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Draw-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name meno_matky_za_slobodna-srv:<Draw-response> is deprecated: use meno_matky_za_slobodna-srv:Draw-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Draw-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader meno_matky_za_slobodna-srv:success-val is deprecated.  Use meno_matky_za_slobodna-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Draw-response>) ostream)
  "Serializes a message object of type '<Draw-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Draw-response>) istream)
  "Deserializes a message object of type '<Draw-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Draw-response>)))
  "Returns string type for a service object of type '<Draw-response>"
  "meno_matky_za_slobodna/DrawResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Draw-response)))
  "Returns string type for a service object of type 'Draw-response"
  "meno_matky_za_slobodna/DrawResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Draw-response>)))
  "Returns md5sum for a message object of type '<Draw-response>"
  "e5eddf88ccd24f8d174671b7bb6a7674")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Draw-response)))
  "Returns md5sum for a message object of type 'Draw-response"
  "e5eddf88ccd24f8d174671b7bb6a7674")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Draw-response>)))
  "Returns full string definition for message of type '<Draw-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Draw-response)))
  "Returns full string definition for message of type 'Draw-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Draw-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Draw-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Draw-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Draw)))
  'Draw-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Draw)))
  'Draw-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Draw)))
  "Returns string type for a service object of type '<Draw>"
  "meno_matky_za_slobodna/Draw")