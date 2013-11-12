(defsystem project-euler
  :description "Solutions to Project Euler problems in Common Lisp"
  :author "Jarrod Jeffrey Ingram <jing0012@uni.sydney.edu.au>"
  :depends-on (:iterate)
  :components ((:file "packages")
               (:file "1-25" :depends-on ("packages"))
               (:file "util" :depends-on ("packages"))))
