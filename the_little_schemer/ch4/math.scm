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

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else (cons (+ (car tup1) (car tup2))
        (tup+ (cdr tup1) (cdr tup2)))))))

(define o>
  (lambda (m n)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else
        (o> (sub1 m) (sub1 n))))))

(define o<
  (lambda (m n)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else
        (o< (sub1 m) (sub1 n))))))

(define o=
  (lambda (m n)
    (cond
      ((o> m n) #f)
      ((o< m n) #f)
      (else #t))))
