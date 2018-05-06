;;; Title: hw2_1-1.lsp
;;; Author: kevin110604
;;; Function: determine if a number is a prime
;;; How to run: sbcl --script hw2_1-1.lsp

(defun prime (x)
    (let ((ans t))                          ; ans=true;
        (do ( (i 2 (+ i 1)) )
            ((> i (sqrt x)) ans)            ; if (i > √x) return ans;
            (if (= (mod x i) 0)             ; if (x%i == 0)
                (setf ans nil)              ; ans=false;
            )
        )
    ) 
)

;(format t "prime(x) will return T if x is a prime, NIL, otherwise.~%~%")
;(format t "prime(2)=~A~%" (prime 2))
;(format t "prime(239)=~A~%" (prime 239))
;(format t "prime(999)=~A~%" (prime 999))
;(format t "prime(17)=~A~%" (prime 17))

;(loop for x in '(2 3 4 5) (if (=(mod 25 x) 0) T NIL))

; main function
(format t "prime(x) will return T if x is a prime, NIL, otherwise.~%")
(format t "Enter an integer: ~%")

(let ((n (read)))
    (format t "~A~%" (prime n))
)