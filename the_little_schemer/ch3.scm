(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (car l))
        (firsts (cdr l)))))))

(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
            (cons new lat))
          (else
            (cons (car lat)
              (insertL new old (cdr lat)))))))))

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
            (cons old
              (cons new (cdr lat))))
          (else
            (cons (car lat)
              (insertR new old (cdr lat)))))))))

(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
            (cons old
              (cons new
                (multiinsertR new old (cdr lat)))))
          (else
            (cons (car lat)
              (multiinsertR new old (cdr lat)))))))))

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) a)
            (multirember a (cdr lat)))
          (else (cons (car lat)
            (multirember a (cdr lat)))))))))

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
            (cons new
              (multisubst new old (cdr lat))))
          (else
            (cons (car lat)
              (multisubst new old (cdr lat)))))))))
