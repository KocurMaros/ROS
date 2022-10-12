
(cl:in-package :asdf)

(defsystem "meno_matky_za_slobodna-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Draw" :depends-on ("_package_Draw"))
    (:file "_package_Draw" :depends-on ("_package"))
    (:file "Start" :depends-on ("_package_Start"))
    (:file "_package_Start" :depends-on ("_package"))
    (:file "Stop" :depends-on ("_package_Stop"))
    (:file "_package_Stop" :depends-on ("_package"))
  ))