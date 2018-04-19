(load "lambda.scm")

(define f1
  (λ (n)
     (cond
       ((zero? n) 1)
       (else (* n (f1 (- n 1)))))))

(define f2
  (λ (n acc)
     (cond
       ((zero? n) acc)
       (else (f2 (- n 1) (* n acc))))))

(define f3
  (λ (n col)
     (cond
       ((zero? n) (col 1))
       (else (f3 (- n 1) (λ (counted-fact) (col (* n counted-fact))))))))
