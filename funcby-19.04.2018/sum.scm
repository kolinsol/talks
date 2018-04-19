(load "lambda.scm")

; sum-l -> sum of a list
(define sum-l
  (λ (l)
     (cond
       ((null? l) 0)
       (else (+ (car l) (sum-l (cdr l)))))))

; sum-t -> sum of a tree
(define sum-t
  (λ (t)
     (cond
       ((null? t) 0)
       ((atom? (car t)) (+ (car t) (sum-t (cdr t))))
       (else (+ (sum-t (car t)) (sum-t (cdr t)))))))

; col -> collector
(define sum-l-c
  (λ (l col)
     (cond
       ((null? l) (col 0))
       (else (sum-l-c (cdr l) (λ (counted-sum)
                                 (col (+ (car l) counted-sum))))))))

(define sum-t-c
  (λ (t col)
     (cond
       ((null? t) (col 0))
       ((atom? (car t))
        (sum-t-c (cdr t) (λ (counted-sum)
                            (col (+ (car t) counted-sum)))))
       (else
        (sum-t-c (car t) (λ (car-sum)
                            (sum-t-c (cdr t) (λ (cdr-sum)
                                                (col (+ car-sum cdr-sum))))))))))
