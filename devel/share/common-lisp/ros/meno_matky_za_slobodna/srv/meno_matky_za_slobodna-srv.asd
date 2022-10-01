
(cl:in-package :asdf)

(defsystem "meno_matky_za_slobodna-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Draw" :depends-on ("_package_Draw"))
    (:file "_package_Draw" :depends-on ("_package"))
  ))