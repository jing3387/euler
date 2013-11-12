(in-package :euler)

(defun last* (list)
  "Returns the last element in a list; as oppossed to the last cons."
  (car (last list)))

(defun prime-factors (n)
  "Prime factors of `n' as a list; smallest to largest."
  (iter (with m = 2)
        (until (= n 1))
        (multiple-value-bind (q r) (truncate n m)
          (when (= r 0)
            (setq n q)
            (collect m)))
        (if-first-time (setf m 3)
                       (incf m 2))))

(defun get-digits (n)
  "Get digits of `n' as a list; least-significant digit first."
  (iter (while (> n 0))
        (collect (mod n 10))
        (setq n (truncate n 10))))

(defun day-of-week (day month year)
  (nth-value 6
    (decode-universal-time (encode-universal-time 0 0 0 day month year))))
