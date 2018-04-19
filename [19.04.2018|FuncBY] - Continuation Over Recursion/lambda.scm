; use |λ| instaed of |lambda|

(define-syntax λ
  (syntax-rules
    () ((_ param body ...) (lambda param body ...))))
