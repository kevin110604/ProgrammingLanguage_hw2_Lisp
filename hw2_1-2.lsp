;;; Title: hw2_1-2.lsp
;;; Author: kevin110604
;;; Function: determine whether its contents form a palindrome
;;; How to run: sbcl --script hw2_1-2.lsp

(defun my_length (lst)
    (let ((len 0))
        (dolist (obj lst)
            (setf len (+ len 1))
        )
        len
    )
)

(defun my_reverse (lst)
    (let ((n (my_length lst)) (ans nil))
        (do ((i 1 (+ i 1)))
            ((> i n) ans)
            (setf ans(cons (car lst) ans))
            (setf lst (cdr lst))
        )
    )
)

(defun my_equal (x y)
    (or (eql x y)
        (and (consp x)
            (consp y)
            (my_equal (car x) (car y))
            (my_equal (cdr x) (cdr y))
        )
    )
)

(defun palindrome (lst) 
    (let ((rev (my_reverse lst)))
        (my_equal lst rev)
    )
)

;(setf x1 '(cat dog bird bird dog cat))
;(format t "palindrome (x1)=~A~%" (palindrome x1))
;(format t "palindrome (x1)=~A~%" (palindrome '(cat dog bird bird dog cat)))

; main function
(format t "palindrome(lst) will return T if lst is a palindrome, NIL, otherwise.~%")
(format t "Enter a list: ~%")

(let ((lst (read)))
    (format t "~A~%" (palindrome lst))
)
