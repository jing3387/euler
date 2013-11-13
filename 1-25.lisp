(in-package :euler)

(defun one ()
  (iter (for i from 1 to 999)
        (sum (if (or (= (rem i 3) 0)
                     (= (rem i 5) 0))
               i
               0))))

(defun two ()
  (iter (with a = 0)
        (with b = 1)
        (while (< a 4000000))
        (when (evenp a)
          (sum a))
        (psetf a b
               b (+ a b))))

(defun three ()
  (last* (prime-factors 600851475143)))

(defun four ()
  (iter outer (for i from 100 to 999)
        (iter (for j from 100 to 999)
              (let* ((k (* i j))
                     (d (get-digits k)))
                (when (equal d (reverse d))
                  (in outer (maximize k)))))))

(defun five ()
  (apply #'lcm (iter (for i from 2 to 20)
                     (collect i))))

(defun six ()
  (let ((sum-squares (iter (for i from 1 to 100)
                           (sum (expt i 2))))
        (squares-sum (expt (iter (for i from 1 to 100)
                                 (sum i)) 2)))
    (- squares-sum sum-squares)))

(defun seven ()
  (iter (with count = 1)
        (for i from 1 by 2)
        (when (primep i)
          (incf count))
        (when (= count 10001)
          (leave i))))

(defun eight ()
  (with-open-file (in "8.txt")
    (iter (with digits = (get-digits (parse-integer (read-line in))))
          (repeat (- (length digits) 5))
          (maximize (reduce #'* (subseq digits 0 5)))
          (setf digits (rest digits)))))

(defun ten ()
  (reduce #'+ (sieve 2000000)))

(defun sixteen ()
  (reduce #'+ (get-digits (expt 2 1000))))

(defun seventeen ()
  (iter (for i from 1 to 1000)
        (let ((len (length (remove-if #'(lambda (x)
                                          (or (eq x #\-) (eq x #\space)))
                                      (format nil "~r" i)))))
          (sum (if (and (/= (mod i 100) 0) (> i 100))
                 (+ len 3)
                 len)))))

(defun nineteen ()
  (iter outer (for year from 1901 to 2000)
        (iter (for month from 1 to 12)
              (in outer (counting (= 6 (day-of-week 1 month year)))))))
