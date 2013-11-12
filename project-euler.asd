(defsystem project-euler
  :description "Solutions to Project Euler problems in Common Lisp"
  :author "Jarrod Jeffrey Ingram <jing0012@uni.sydney.edu.au>"
  :depends-on (:iterate)
  :components ((:file "packages")
               (:file "1" :depends-on ("packages"))
               (:file "2" :depends-on ("packages"))
               (:file "3" :depends-on ("packages"))
               (:file "16" :depends-on ("packages"))
               (:file "17" :depends-on ("packages"))
               (:file "19" :depends-on ("packages"))))
