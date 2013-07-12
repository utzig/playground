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

(define ex
  (lambda (m n)
    (cond
      ((zero? n) 1)
      (else (* m (ex m (sub1 n)))))))

(define o/
  (lambda (m n)
    (cond
      ((< m n) 0)
      (else (add1 (o/ (- m n) n))))))

(define len
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (len (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
      (else (all-nums (cdr lat))))))

(define eqan?
  (lambda (n m)
    (cond
      ((and (number? n) (number? m)) (= n m))
      (else (eq? n m)))))

(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else (cond
        ((eq? a (car lat)) (add1 (occur a (cdr lat))))
        (else (occur a (cdr lat))))))))

(define one?
  (lambda (n)
    (= 1 n)))

(define rempick
  (lambda (n lat)
    (cond
      ((one? n) (cdr lat))
      (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))
