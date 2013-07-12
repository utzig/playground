; define a + function that uses zero?, add1, sub1
(define o+
  (lambda (m n)
    (cond
      ((zero? m) n)
      (else (add1 (o+ n (sub1 m)))))))

; define a - function that uses zero?, add1, sub1
(define o-
  (lambda (m n)
    (cond
      ((zero? m) n)
      (else (sub1 (o- n (sub1 m)))))))

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (+ (car tup) (addtup (cdr tup)))))))

(define x
  (lambda (m n)
    (cond
      ((zero? m) 0)
      (else (+ n (x n (sub1 m)))))))
