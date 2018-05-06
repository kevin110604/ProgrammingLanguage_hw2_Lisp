;;; Title: hw2_2.lsp
;;; Author: E94046050
;;; Function: merge sort
;;; How to run: sbcl --script hw2_2.lsp 

; 讀取list當中的第n個值
(defun pick_list (lst n)
    (do ((i 0 (+ i 1)))
        ((= i (- n 1)) 'DONE)
        (setf lst (cdr lst)) 
    )
    (setf lst (car lst))
)

; 將list當中的第n個值assign為data
(defun as_list (lst n data)
    (let ((tmp nil))
        (do ((i 0 (+ i 1)))
            ((= i (- n 1)) 'DONE)
            (setf tmp (cons (car lst) tmp))
            (setf lst (cdr lst)) 
        )
        (setf lst (cdr lst))
        (setf lst (cons data lst))
        (dolist (x tmp)
            (setf lst (cons x lst))
        )
        lst
    )
)

(defun mmerge (numbers l m r)
    (let ( (L_num nil) (R_num nil) (n1 (+ (- m l) 1)) (n2 (- r m)) (ii 0) (jj 0) (kk 0) )
        (do ((i 0 (+ i 1)))
            ((= i n1) t)
            (setf L_num (append L_num (list (pick_list numbers (+ l i)))))
        )
        (do ((j 0 (+ j 1)))
            ((= j n2) 'DONE)
            (setf R_num (append R_num (list (pick_list numbers (+ m 1 j)))))
        )
        ;(format t "L_num=~A~%" L_num)
        ;(format t "R_num=~A~%" R_num)

        (do ((k l (+ k 1)))
            ((or (= ii n1) (= jj n2)) 'DONE)
            (if (< (car L_num) (car R_num))
                (progn
                    (setf numbers (as_list numbers k (car L_num)))      ; arr[k] = L[i];
                    (setf ii (+ ii 1))
                    (setf L_num (cdr L_num))
                )
                (progn
                    (setf numbers (as_list numbers k (car R_num)))      ; arr[k] = R[j];
                    (setf jj (+ jj 1))
                    (setf R_num (cdr R_num))
                )
            )
            (setf kk (+ k 1))                                           ; kk=k+1;
        )
        ;(format t "~A~%" ans)
        (if (< ii n1)
            (dolist (x L_num)
                (setf numbers (as_list numbers kk x))                   ; arr[kk]=L[i++];
                (setf kk (+ kk 1))                                      ; kk++;
            )
        )
        (if (< jj n2)
            (dolist (x R_num)
                (setf numbers (as_list numbers kk x))                   ; arr[kk]=R[j++];
                (setf kk (+ kk 1))                                      ; kk++;
            )
        )
        ;(format t "ans_num=~A~%" numbers)
        ;(return-from mmerge ans)
        numbers
    )
)

(defun mergesort (numbers l r) 
    (let ((m 0))
        (if (< l r)
            (progn 
                (setf m (floor (/ (+ l r) 2)))                      ; int m = (l+r)/2;
                (setf numbers (mergesort numbers l m))              ; mergeSort(arr, l, m);
                (setf numbers (mergesort numbers (+ m 1) r))        ; mergeSort(arr, m+1, r);
                (setf numbers (mmerge numbers l m r))               ; merge(arr, l, m, r);
            )
        )
    )
    numbers
    ;(return-from mergesort numbers)
)

;(setf arr '(5 2 4 7 1 3 2 6))
;(mergesort arr 1 8)

; main function
(let ((n (read)) (numbers))
    (setf numbers
        (do ((i 0 (+ i 1)) (tmp nil))
            ((>= i n) (reverse tmp))
            (setf tmp (cons (read) tmp))
        )
    )
    (format t "~{~A ~}~%" (mergesort numbers 1 n))
)


