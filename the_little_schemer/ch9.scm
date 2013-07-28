(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(define keep-looking
  (lambda (a sorn lat)
    (cond
      ((number? sorn)
        (keep-looking a (pick sorn lat) lat))
      (else (eq? sorn a)))))

(define A
  (lambda (n m)
    (cond
      ((zero? n) (add1 m))
      ((zero? m) (A (sub1 n) 1))
      (else (A (sub1 n) (A n (sub1 m)))))))

(define length
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (length (cdr l)))))))

; example mk-length usage
;(((lambda (mk-length)
;    (mk-length mk-length))
;  (lambda (mk-length)
;    ((lambda (length)
;      (lambda (l)
;        (cond
;          ((null? l) 0)
;          (else (add1 (length (cdr l)))))))
;    (mk-length mk-length)))) '(apples))

; Y Combinator!!! :-)
(define Y
  (lambda (le)
    ((lambda (f) (f f))
      (lambda (f)
        (le (lambda (x) ((f f) x)))))))
