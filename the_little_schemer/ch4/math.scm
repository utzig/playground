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
