; Auto-generated. Do not edit!


(cl:in-package rrm_cv1-srv)


;//! \htmlinclude Draw-request.msg.html

(cl:defclass <Draw-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass Draw-request (<Draw-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Draw-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Draw-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rrm_cv1-srv:<Draw-request> is deprecated: use rrm_cv1-srv:Draw-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Draw-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rrm_cv1-srv:speed-val is deprecated.  Use rrm_cv1-srv:speed instead.")
  (speed m))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Draw-request>)))
  "Returns string type for a service object of type '<Draw-request>"
  "rrm_cv1/DrawRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Draw-request)))
  "Returns string type for a service object of type 'Draw-request"
  "rrm_cv1/DrawRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Draw-request>)))
  "Returns md5sum for a message object of type '<Draw-request>"
  "8b2c4ed0ef6d3410f781d1290f9db82d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Draw-request)))
  "Returns md5sum for a message object of type 'Draw-request"
  "8b2c4ed0ef6d3410f781d1290f9db82d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Draw-request>)))
  "Returns full string definition for message of type '<Draw-request>"
  (cl:format cl:nil "int64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Draw-request)))
  "Returns full string definition for message of type 'Draw-request"
  (cl:format cl:nil "int64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Draw-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Draw-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Draw-request
    (cl:cons ':speed (speed msg))
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rrm_cv1-srv:<Draw-response> is deprecated: use rrm_cv1-srv:Draw-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Draw-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rrm_cv1-srv:success-val is deprecated.  Use rrm_cv1-srv:success instead.")
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
  "rrm_cv1/DrawResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Draw-response)))
  "Returns string type for a service object of type 'Draw-response"
  "rrm_cv1/DrawResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Draw-response>)))
  "Returns md5sum for a message object of type '<Draw-response>"
  "8b2c4ed0ef6d3410f781d1290f9db82d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Draw-response)))
  "Returns md5sum for a message object of type 'Draw-response"
  "8b2c4ed0ef6d3410f781d1290f9db82d")
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
  "rrm_cv1/Draw")