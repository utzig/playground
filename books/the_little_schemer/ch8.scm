(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

(define eq?-salad (eq?-c 'salad))

;(define rember-f
;  (lambda (test?)
;    (lambda (a l)
;      (cond
;        ((null? l) '())
;        ((test? (car l) a) (cdr l))
;        (else (cons (car l) (rember-f test? a (cdr l))))))))

;(define rember-eq? (lambda (rember-f eq?)))

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((eq? (car l) old)
          (seq new old l))
        (else (cons (car l)
                ((insert-g seq) new old (cdr l))))))))

(define insertL (insert-g seqL))
(define insertR (insert-g seqR))

(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x '+) +)
      ((eq? x '*) *)
      (else exp))))

;(define value
;  (lambda (nexp)
;    (cond
;      ((atom? nexp) nexp)
;      (else (atom-to-function nexp)
;        (value (1st-sub-exp nexp))
;        (value (2nd-sub-exp nexp))))))

(define multirember&co
  (lambda (a lat col)
    (cond
      ((null? lat)
        (col '() '()))
      ((eq? (car lat) a)
        (multirember&co a (cdr lat)
                          (lambda (newlat seen)
                            (col newlat
                              (cons (car lat) seen)))))
      (else
        (multirember&co a (cdr lat)
                          (lambda (newlat seen)
                            (col (cons (car lat) newlat) seen)))))))

(define a-friend
  (lambda (x y)
    (null? y)))

(define last-friend
  (lambda (x y)
    (length x)))

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
      ((null? lat) '() 0 0)
      ((eq? (car lat) oldL)
        (multiinsertLR&co new oldL oldR (cdr lat)
          (lambda (newlat L R)
            (col (cons new
                   (cons oldL newlat)) (add1 L) R))))
      ((eq? (car lat) oldR)
        (multiinsertLR&co new oldL oldR (cdr lat)
          (lambda (newlat L R)
            (col (cons oldR
                   (cons new newlat)) L (add1 R)))))
      (else
        (multiinsertLR&co new oldL oldR (cdr lat)
          (lambda (newlat L R)
            (col (cons (car lat) newlat)) L R))))))

; even? already available in chicken scheme (at least)
;(define even?
;  (lambda (n)
;    (= (* (/ n 2) 2) n)))

(define evens-only*&co
  (lambda (l col)
    (cond
      ((null? l) (col '() 1 0))
      ((atom? (car l))
        (cond
          ((even? (car l))
            (evens-only*&co (cdr l)
              (lambda (newl p s)
                (col (cons (car l) newl)
                  (* (car l) p) s))))
          (else
            (evens-only*&co (cdr l)
              (lambda (newl p s)
                (col newl p (+ (car l) s)))))))
      (else
        (evens-only*&co (car l)
          (lambda (al ap as)
            (evens-only*&co (cdr l)
              (lambda (dl dp ds)
                (col (cons al dl) (* ap dp) (+ as ds))))))))))

(define the-last-friend
  (lambda (newl product sum)
    (cons sum (cons product newl))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Is your brain twisted now???  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
