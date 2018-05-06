;;; Title: hw2_1-3.lsp
;;; Author: kevin110604
;;; Function: Fibonacci
;;; How to run: sbcl --script hw2_1-3.lsp

; original recursion ver.
(defun fib1(n)
    (if (< n 2)
        n
        (+ (fib1 (- n 1) ) (fib1 (- n 2) ) )
    )
)

; tail recursion ver.
(defun tailfib (n pre1 pre2)
    (cond
        ( (= n 0) pre2)
        ( (= n 1) pre1)
        (t (tailfib (- n 1) (+ pre1 pre2) pre1 ))
    )
)

(defun fib2(n)
    (tailfib n 1 0)
)

; main function
(trace fib1)
(trace fib2)
(format t "Enter an integer: ~%")

(let ((n (read)))
    (format t "fib1(~A)=~A~%~%" n (fib1 n))
    (format t "fib2(~A)=~A~%~%" n (fib2 n))
)