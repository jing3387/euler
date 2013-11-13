(in-package :euler)

(defun last* (list)
  "Returns the last element in a list; as oppossed to the last cons."
  (car (last list)))

(defun sieve (limit)
  "Sieve of Eratosthenes with wheel factorisation up to `limit'."
  (cons 2
        (let ((bound (ash (1- limit) -1))
              (cross-limit (ash (isqrt limit) -1)))
          (iter (with wheel = (make-array (1+ bound)
                                          :element-type 'bit
                                          :initial-element 0))
                (for i from 1 to bound)
                (when (zerop (sbit wheel i))
                  (collect (1+ (ash i 1))))
                (unless (> i cross-limit)
                  (iter (for j from (ash (* i (1+ i)) 1)
                             to bound by (1+ (ash i 1)))
                        (setf (sbit wheel j) 1)))))))

(defun primep (n)
  "Primality test for `n' using trial division."
  (cond
    ((= n 1) nil)
    ((< n 4) t)
    ((zerop (mod n 2)) nil)
    ((< n 9) t)
    ((zerop (mod n 3)) nil)
    (t (iter (for i from 5 to (isqrt n) by 6)
             (never (or (zerop (rem n i)) (zerop (rem n (+ i 2)))))))))

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
