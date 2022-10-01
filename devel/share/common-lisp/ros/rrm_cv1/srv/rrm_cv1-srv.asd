
(cl:in-package :asdf)

(defsystem "rrm_cv1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Draw" :depends-on ("_package_Draw"))
    (:file "_package_Draw" :depends-on ("_package"))
  ))